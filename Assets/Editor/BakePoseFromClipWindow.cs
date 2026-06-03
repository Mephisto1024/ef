#if UNITY_EDITOR
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public sealed class BakePoseFromClipWindow : EditorWindow
{
    private GameObject characterRoot;
    private AnimationClip clip;
    private float time;
    private string lastReport;

    private struct TransformPose
    {
        public Transform Transform;
        public Vector3 LocalPosition;
        public Quaternion LocalRotation;
        public Vector3 LocalScale;
    }

    private sealed class CurvePose
    {
        public Vector3 LocalPosition;
        public Quaternion LocalRotation;
        public Vector3 LocalScale;
        public Vector3 LocalEulerAngles;
        public bool HasPosition;
        public bool HasRotation;
        public bool HasScale;
        public bool HasEulerAngles;
    }

    [MenuItem("Tools/Animation/Bake Pose From Clip")]
    private static void Open()
    {
        GetWindow<BakePoseFromClipWindow>("Bake Pose");
    }

    private void OnGUI()
    {
        if (characterRoot == null && Selection.activeGameObject != null)
        {
            characterRoot = Selection.activeGameObject;
        }

        characterRoot = (GameObject)EditorGUILayout.ObjectField(
            "Character Root",
            characterRoot,
            typeof(GameObject),
            true);

        clip = (AnimationClip)EditorGUILayout.ObjectField(
            "Animation Clip",
            clip,
            typeof(AnimationClip),
            false);

        using (new EditorGUI.DisabledScope(clip == null))
        {
            var maxTime = clip != null ? clip.length : 0f;
            time = EditorGUILayout.Slider("Time Seconds", time, 0f, maxTime);
        }

        using (new EditorGUI.DisabledScope(characterRoot == null || clip == null))
        {
            if (GUILayout.Button("Bake Pose To Bones"))
            {
                Bake();
            }
        }

        if (!string.IsNullOrEmpty(lastReport))
        {
            EditorGUILayout.Space();
            EditorGUILayout.HelpBox(lastReport, MessageType.Info);
        }
    }

    private void Bake()
    {
        var sampleTime = Mathf.Clamp(time, 0f, clip.length);
        var transforms = characterRoot.GetComponentsInChildren<Transform>(true);
        var before = new TransformPose[transforms.Length];

        for (var i = 0; i < transforms.Length; i++)
        {
            before[i] = new TransformPose
            {
                Transform = transforms[i],
                LocalPosition = transforms[i].localPosition,
                LocalRotation = transforms[i].localRotation,
                LocalScale = transforms[i].localScale
            };

        }

        Undo.RegisterFullObjectHierarchyUndo(characterRoot, "Bake Pose From Clip");

        var transformCurveCount = CountTransformCurves();
        var matchedCurveCount = BakeDirectTransformCurves(transforms, sampleTime);

        var after = new TransformPose[transforms.Length];
        for (var i = 0; i < transforms.Length; i++)
        {
            after[i] = new TransformPose
            {
                Transform = transforms[i],
                LocalPosition = transforms[i].localPosition,
                LocalRotation = transforms[i].localRotation,
                LocalScale = transforms[i].localScale
            };

            EditorUtility.SetDirty(transforms[i]);
            PrefabUtility.RecordPrefabInstancePropertyModifications(transforms[i]);
        }

        EditorUtility.SetDirty(characterRoot);
        var changedCount = CountChanged(before, after);

        lastReport =
            $"Clip: {clip.name}\n" +
            $"Time: {sampleTime:0.###}s\n" +
            $"Transform curves in clip: {transformCurveCount}\n" +
            $"Transform curves matched under root: {matchedCurveCount}\n" +
            $"Transforms changed: {changedCount}";

        if (changedCount == 0)
        {
            Debug.LogWarning(
                $"Bake pose did not change any transforms. Clip '{clip.name}' has {transformCurveCount} transform curves, " +
                $"and {matchedCurveCount} transform curves matched under '{characterRoot.name}'. " +
                "If this is a Humanoid muscle clip, it may not contain direct bone transform curves to bake this way.");
        }
        else
        {
            Debug.Log($"Baked pose from {clip.name} at {sampleTime:0.###}s to {characterRoot.name}. Changed transforms: {changedCount}.");
        }
    }

    private int BakeDirectTransformCurves(Transform[] transforms, float sampleTime)
    {
        var pathToTransform = new Dictionary<string, Transform>();
        foreach (var t in transforms)
        {
            pathToTransform[AnimationUtility.CalculateTransformPath(t, characterRoot.transform)] = t;
        }

        var poseByTransform = new Dictionary<Transform, CurvePose>();
        var matchedCurveCount = 0;

        foreach (var binding in AnimationUtility.GetCurveBindings(clip))
        {
            if (binding.type != typeof(Transform) || !IsTransformProperty(binding.propertyName))
            {
                continue;
            }

            var target = FindTargetTransform(binding.path, pathToTransform);
            if (target == null)
            {
                continue;
            }

            if (!poseByTransform.TryGetValue(target, out var pose))
            {
                pose = new CurvePose
                {
                    LocalPosition = target.localPosition,
                    LocalRotation = target.localRotation,
                    LocalScale = target.localScale,
                    LocalEulerAngles = target.localEulerAngles
                };
                poseByTransform[target] = pose;
            }

            var curve = AnimationUtility.GetEditorCurve(clip, binding);
            if (curve == null)
            {
                continue;
            }

            ApplyCurveValue(pose, binding.propertyName, curve.Evaluate(sampleTime));
            matchedCurveCount++;
        }

        foreach (var item in poseByTransform)
        {
            var target = item.Key;
            var pose = item.Value;

            if (pose.HasPosition)
            {
                target.localPosition = pose.LocalPosition;
            }

            if (pose.HasRotation)
            {
                pose.LocalRotation.Normalize();
                target.localRotation = pose.LocalRotation;
            }
            else if (pose.HasEulerAngles)
            {
                target.localEulerAngles = pose.LocalEulerAngles;
            }

            if (pose.HasScale)
            {
                target.localScale = pose.LocalScale;
            }
        }

        return matchedCurveCount;
    }

    private Transform FindTargetTransform(string bindingPath, Dictionary<string, Transform> pathToTransform)
    {
        if (pathToTransform.TryGetValue(bindingPath, out var exact))
        {
            return exact;
        }

        var rootPrefix = characterRoot.name + "/";
        if (bindingPath.StartsWith(rootPrefix)
            && pathToTransform.TryGetValue(bindingPath.Substring(rootPrefix.Length), out var withoutRoot))
        {
            return withoutRoot;
        }

        foreach (var item in pathToTransform)
        {
            if (EndsWithPath(item.Key, bindingPath) || EndsWithPath(bindingPath, item.Key))
            {
                return item.Value;
            }
        }

        return null;
    }

    private static bool EndsWithPath(string path, string suffix)
    {
        if (string.IsNullOrEmpty(path) || string.IsNullOrEmpty(suffix))
        {
            return false;
        }

        return path == suffix || path.EndsWith("/" + suffix);
    }

    private static void ApplyCurveValue(CurvePose pose, string propertyName, float value)
    {
        switch (propertyName)
        {
            case "m_LocalPosition.x":
                pose.LocalPosition.x = value;
                pose.HasPosition = true;
                break;
            case "m_LocalPosition.y":
                pose.LocalPosition.y = value;
                pose.HasPosition = true;
                break;
            case "m_LocalPosition.z":
                pose.LocalPosition.z = value;
                pose.HasPosition = true;
                break;
            case "m_LocalRotation.x":
                pose.LocalRotation.x = value;
                pose.HasRotation = true;
                break;
            case "m_LocalRotation.y":
                pose.LocalRotation.y = value;
                pose.HasRotation = true;
                break;
            case "m_LocalRotation.z":
                pose.LocalRotation.z = value;
                pose.HasRotation = true;
                break;
            case "m_LocalRotation.w":
                pose.LocalRotation.w = value;
                pose.HasRotation = true;
                break;
            case "m_LocalScale.x":
                pose.LocalScale.x = value;
                pose.HasScale = true;
                break;
            case "m_LocalScale.y":
                pose.LocalScale.y = value;
                pose.HasScale = true;
                break;
            case "m_LocalScale.z":
                pose.LocalScale.z = value;
                pose.HasScale = true;
                break;
            case "localEulerAnglesRaw.x":
                pose.LocalEulerAngles.x = value;
                pose.HasEulerAngles = true;
                break;
            case "localEulerAnglesRaw.y":
                pose.LocalEulerAngles.y = value;
                pose.HasEulerAngles = true;
                break;
            case "localEulerAnglesRaw.z":
                pose.LocalEulerAngles.z = value;
                pose.HasEulerAngles = true;
                break;
        }
    }

    private int CountTransformCurves()
    {
        var count = 0;
        foreach (var binding in AnimationUtility.GetCurveBindings(clip))
        {
            if (binding.type == typeof(Transform) && IsTransformProperty(binding.propertyName))
            {
                count++;
            }
        }

        return count;
    }

    private static bool IsTransformProperty(string propertyName)
    {
        return propertyName.StartsWith("m_LocalPosition.")
            || propertyName.StartsWith("m_LocalRotation.")
            || propertyName.StartsWith("m_LocalScale.")
            || propertyName.StartsWith("localEulerAnglesRaw.");
    }

    private static int CountChanged(TransformPose[] before, TransformPose[] after)
    {
        var count = 0;

        for (var i = 0; i < before.Length; i++)
        {
            if (before[i].LocalPosition != after[i].LocalPosition
                || before[i].LocalRotation != after[i].LocalRotation
                || before[i].LocalScale != after[i].LocalScale)
            {
                count++;
            }
        }

        return count;
    }
}
#endif
