using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

internal static class NprMaterialPropertyUtility
{
    public static void SetDefaultTextureIfNeeded(MaterialProperty property, string assetPath)
    {
        if (property == null || property.hasMixedValue || property.textureValue != null)
            return;

        property.textureValue = AssetDatabase.LoadAssetAtPath<Texture>(assetPath);
    }
}
