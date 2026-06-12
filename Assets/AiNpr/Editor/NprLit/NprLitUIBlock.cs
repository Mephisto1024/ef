using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

namespace UnityEditor.Rendering.HighDefinition
{
    /// <summary>
    /// The UI block that displays NPR hair inputs.
    /// </summary>
    public class NprLitUIBlock : MaterialUIBlock
    {
        internal class Styles
        {
            public static readonly GUIContent header = EditorGUIUtility.TrTextContent("Lit Inputs");

            public static GUIContent iblReflectionCubeMap = new GUIContent("IBL Reflection Cube Map", "Specifies the reflection cubemap for NPR lit IBL.");
            public static GUIContent f0TintLutMap = new GUIContent("F0 Tint LUT Map", "Specifies the F0 tint lookup texture for NPR lit.");
        }

        const string kDefaultIblReflectionCubeMapPath = "Assets/AiNpr/Texture/Glazed Patio.exr";
        const string kIblReflectionCubeMap = "_IblReflectionCubeMap";
        const string kF0TintLutMap = "_F0TintLutMap";

        MaterialProperty iblReflectionCubeMap = null;
        MaterialProperty f0TintLutMap = null;

        /// <summary>
        /// Constructs an NPR hair UI block.
        /// </summary>
        /// <param name="expandableBit">Bit index used to store the foldout state.</param>
        public NprLitUIBlock(ExpandableBit expandableBit)
            : base(expandableBit, Styles.header)
        {
        }

        /// <summary>
        /// Loads the material properties for the block.
        /// </summary>
        public override void LoadMaterialProperties()
        {
            iblReflectionCubeMap = FindProperty(kIblReflectionCubeMap, false);
            f0TintLutMap = FindProperty(kF0TintLutMap, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (iblReflectionCubeMap == null && f0TintLutMap == null)
                return;

            if (iblReflectionCubeMap != null)
            {
                SetDefaultIblReflectionCubeMapIfNeeded();
                materialEditor.TexturePropertySingleLine(Styles.iblReflectionCubeMap, iblReflectionCubeMap);
            }

            if (f0TintLutMap != null)
                materialEditor.TexturePropertySingleLine(Styles.f0TintLutMap, f0TintLutMap);
        }

        void SetDefaultIblReflectionCubeMapIfNeeded()
        {
            if (iblReflectionCubeMap.hasMixedValue || iblReflectionCubeMap.textureValue != null)
                return;

            iblReflectionCubeMap.textureValue = AssetDatabase.LoadAssetAtPath<Texture>(kDefaultIblReflectionCubeMapPath);
        }
    }
}
