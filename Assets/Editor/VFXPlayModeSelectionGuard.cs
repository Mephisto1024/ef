using UnityEditor;

[InitializeOnLoad]
internal static class VFXPlayModeSelectionGuard
{
    static VFXPlayModeSelectionGuard()
    {
        EditorApplication.playModeStateChanged += OnPlayModeStateChanged;
    }

    private static void OnPlayModeStateChanged(PlayModeStateChange state)
    {
        if (state == PlayModeStateChange.ExitingEditMode)
            Selection.objects = System.Array.Empty<UnityEngine.Object>();
    }
}
