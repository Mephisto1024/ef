#if UNITY_EDITOR
using System;
using System.IO;
using UnityEditor;
using UnityEngine;

public sealed class TextureVerticalFlipWindow : EditorWindow
{
    private Texture2D texture;
    private string lastReport;

    [MenuItem("Tools/Texture/Vertical Flip")]
    private static void Open()
    {
        GetWindow<TextureVerticalFlipWindow>("Texture Flip");
    }

    private void OnGUI()
    {
        texture = (Texture2D)EditorGUILayout.ObjectField(
            "Texture",
            texture,
            typeof(Texture2D),
            false);

        using (new EditorGUI.DisabledScope(texture == null))
        {
            if (GUILayout.Button("Vertical Flip"))
            {
                FlipSelectedTexture();
            }
        }

        if (!string.IsNullOrEmpty(lastReport))
        {
            EditorGUILayout.Space();
            EditorGUILayout.HelpBox(lastReport, MessageType.Info);
        }
    }

    private void FlipSelectedTexture()
    {
        var assetPath = AssetDatabase.GetAssetPath(texture);
        if (string.IsNullOrEmpty(assetPath))
        {
            lastReport = "Please choose a texture asset from the Project window.";
            return;
        }

        var importer = AssetImporter.GetAtPath(assetPath) as TextureImporter;
        if (importer == null)
        {
            lastReport = "The selected asset is not handled by TextureImporter.";
            return;
        }

        var wasReadable = importer.isReadable;
        try
        {
            if (!wasReadable)
            {
                importer.isReadable = true;
                importer.SaveAndReimport();
            }

            var readableTexture = AssetDatabase.LoadAssetAtPath<Texture2D>(assetPath);
            var flippedTexture = CreateFlippedTexture(readableTexture);
            var bytes = EncodeTexture(flippedTexture, assetPath);

            if (bytes == null)
            {
                if (!wasReadable)
                {
                    importer.isReadable = false;
                    importer.SaveAndReimport();
                }

                lastReport = "Unsupported image file type. Supported: png, jpg, jpeg, tga, exr.";
                DestroyImmediate(flippedTexture);
                return;
            }

            File.WriteAllBytes(ToAbsolutePath(assetPath), bytes);
            DestroyImmediate(flippedTexture);

            if (!wasReadable)
            {
                importer.isReadable = false;
            }

            importer.SaveAndReimport();
            AssetDatabase.Refresh();
            lastReport = $"Vertical flipped: {assetPath}";
            Debug.Log($"Vertical flipped texture: {assetPath}");
        }
        catch (Exception exception)
        {
            lastReport = $"Failed to flip texture:\n{exception.Message}";
            Debug.LogException(exception);

            if (!wasReadable && importer.isReadable)
            {
                importer.isReadable = false;
                importer.SaveAndReimport();
            }
        }
    }

    private static Texture2D CreateFlippedTexture(Texture2D source)
    {
        var width = source.width;
        var height = source.height;
        var sourcePixels = source.GetPixels();
        var flippedPixels = new Color[sourcePixels.Length];

        for (var y = 0; y < height; y++)
        {
            var sourceRow = y * width;
            var targetRow = (height - 1 - y) * width;
            Array.Copy(sourcePixels, sourceRow, flippedPixels, targetRow, width);
        }

        var flipped = new Texture2D(width, height, TextureFormat.RGBA32, false);
        flipped.SetPixels(flippedPixels);
        flipped.Apply();
        return flipped;
    }

    private static byte[] EncodeTexture(Texture2D textureToEncode, string assetPath)
    {
        switch (Path.GetExtension(assetPath).ToLowerInvariant())
        {
            case ".png":
                return textureToEncode.EncodeToPNG();
            case ".jpg":
            case ".jpeg":
                return textureToEncode.EncodeToJPG();
            case ".tga":
                return textureToEncode.EncodeToTGA();
            case ".exr":
                return textureToEncode.EncodeToEXR();
            default:
                return null;
        }
    }

    private static string ToAbsolutePath(string assetPath)
    {
        var projectPath = Path.GetFullPath(Path.Combine(Application.dataPath, ".."));
        return Path.GetFullPath(Path.Combine(projectPath, assetPath));
    }
}
#endif
