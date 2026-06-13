using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

[DisallowMultipleComponent]
[ExecuteAlways]
public class NprCustomPass : MonoBehaviour
{
    const string VolumeObjectName = "__NprCustomPassVolume";

    CustomPassVolume volume;
    OutlineCustomPass outlinePass;

    void OnEnable()
    {
        InstallOrUpdate();
    }

    void OnDisable()
    {
        if (volume != null)
            volume.enabled = false;
    }

#if UNITY_EDITOR
    void Reset()
    {
        InstallOrUpdate();
    }

    void OnValidate()
    {
        InstallOrUpdate();
    }
#endif

    void InstallOrUpdate()
    {
        volume = GetOrCreateHiddenVolume();
        if (volume == null)
            return;

        volume.enabled = enabled;
        volume.isGlobal = true;
        volume.injectionPoint = CustomPassInjectionPoint.AfterOpaqueAndSky;

        RemoveUnsupportedPasses(volume);

        outlinePass = FindOrCreatePass<OutlineCustomPass>(volume);
        if (outlinePass == null)
            return;

        outlinePass.targetColorBuffer = CustomPass.TargetBuffer.Camera;
        outlinePass.targetDepthBuffer = CustomPass.TargetBuffer.Camera;
        outlinePass.clearFlags = ClearFlag.None;
        outlinePass.renderQueueType = CustomPass.RenderQueueType.All;
        outlinePass.layerMask = ~0;
    }

    CustomPassVolume GetOrCreateHiddenVolume()
    {
        var volumeTransform = transform.Find(VolumeObjectName);
        if (volumeTransform == null)
        {
            var volumeObject = new GameObject(VolumeObjectName);
            volumeObject.transform.SetParent(transform, false);
            volumeObject.hideFlags = HideFlags.HideInHierarchy | HideFlags.NotEditable;
            volumeTransform = volumeObject.transform;
        }

        volumeTransform.gameObject.hideFlags = HideFlags.HideInHierarchy | HideFlags.NotEditable;

        var customPassVolume = volumeTransform.GetComponent<CustomPassVolume>();
        if (customPassVolume == null)
            customPassVolume = volumeTransform.gameObject.AddComponent<CustomPassVolume>();

        customPassVolume.hideFlags = HideFlags.NotEditable;
        return customPassVolume;
    }

    static void RemoveUnsupportedPasses(CustomPassVolume customPassVolume)
    {
        for (var i = customPassVolume.customPasses.Count - 1; i >= 0; i--)
        {
            if (customPassVolume.customPasses[i] is not OutlineCustomPass)
                customPassVolume.customPasses.RemoveAt(i);
        }
    }

    static T FindOrCreatePass<T>(CustomPassVolume customPassVolume) where T : CustomPass
    {
        foreach (var customPass in customPassVolume.customPasses)
        {
            if (customPass is T typedPass)
                return typedPass;
        }

        var newPass = customPassVolume.AddPassOfType<T>() as T;
        if (newPass != null)
            newPass.name = typeof(T).Name;

        return newPass;
    }
}
