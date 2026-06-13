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

            public static GUIContent useViewLutCoord = new GUIContent("Use View LUT Coord", "Uses view LUT coordinates instead of GGX LUT coordinates.");
            public static GUIContent iblReflectionCubeMap = new GUIContent("IBL Reflection Cube Map", "Specifies the reflection cubemap for NPR lit IBL.");
            public static GUIContent f0TintLutMap = new GUIContent("F0 Tint LUT Map", "Specifies the F0 tint lookup texture for NPR lit.");
            public static GUIContent nprLitDebugEnabled = new GUIContent("Enable Intermediate Debug", "Overrides the lit color with a selected intermediate value.");
            public static GUIContent nprLitDebugMode = new GUIContent("Intermediate Debug Mode", "Selects which NPR lit intermediate value is shown.");
            public static readonly GUIContent[] nprLitDebugModeNames =
            {
                new GUIContent("None"),
                new GUIContent("TextureSample/baseColor"),
                new GUIContent("TextureSample/alpha"),
                new GUIContent("TextureSample/metallicMask"),
                new GUIContent("TextureSample/aoMask"),
                new GUIContent("TextureSample/smoothness"),
                new GUIContent("TextureSample/perceptualRoughness"),
                new GUIContent("TextureSample/normalMapSample"),
                new GUIContent("TextureSample/emission"),
                new GUIContent("Lighting/characterShadow"),
                new GUIContent("Lighting/sceneShadowAndRawShadow"),
                new GUIContent("Lighting/mainRampSample"),
                new GUIContent("Lighting/finalDiffuseTerm"),
                new GUIContent("Lighting/f0LutTint"),
                new GUIContent("Lighting/iblReflectionLighting"),
                new GUIContent("Lighting/rimLighting"),
                new GUIContent("Lighting/ambientBackLighting"),
            };
            public static readonly int[] nprLitDebugModeValues =
            {
                0,
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
            };
        }

        const string kDefaultIblReflectionCubeMapPath = "Assets/AiNpr/Texture/Glazed Patio.exr";
        const string kUseViewLutCoord = "_UseViewLutCoord";
        const string kIblReflectionCubeMap = "_IblReflectionCubeMap";
        const string kF0TintLutMap = "_F0TintLutMap";
        const string kNprLitDebugEnabled = "_NprLitDebugEnabled";
        const string kNprLitDebugMode = "_NprLitDebugMode";

        MaterialProperty useViewLutCoord = null;
        MaterialProperty iblReflectionCubeMap = null;
        MaterialProperty f0TintLutMap = null;
        MaterialProperty nprLitDebugEnabled = null;
        MaterialProperty nprLitDebugMode = null;

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
            useViewLutCoord = FindProperty(kUseViewLutCoord, false);
            iblReflectionCubeMap = FindProperty(kIblReflectionCubeMap, false);
            f0TintLutMap = FindProperty(kF0TintLutMap, false);
            nprLitDebugEnabled = FindProperty(kNprLitDebugEnabled, false);
            nprLitDebugMode = FindProperty(kNprLitDebugMode, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (useViewLutCoord == null && iblReflectionCubeMap == null && f0TintLutMap == null && nprLitDebugEnabled == null && nprLitDebugMode == null)
                return;

            if (useViewLutCoord != null)
                materialEditor.ShaderProperty(useViewLutCoord, Styles.useViewLutCoord);

            if (iblReflectionCubeMap != null)
            {
                SetDefaultIblReflectionCubeMapIfNeeded();
                materialEditor.TexturePropertySingleLine(Styles.iblReflectionCubeMap, iblReflectionCubeMap);
            }

            if (f0TintLutMap != null)
                materialEditor.TexturePropertySingleLine(Styles.f0TintLutMap, f0TintLutMap);

            if (nprLitDebugEnabled == null || nprLitDebugMode == null)
                return;

            materialEditor.ShaderProperty(nprLitDebugEnabled, Styles.nprLitDebugEnabled);

            if (nprLitDebugEnabled.floatValue <= 0.5f && !nprLitDebugEnabled.hasMixedValue)
                return;

            MaterialEditor.BeginProperty(nprLitDebugMode);
            EditorGUI.BeginChangeCheck();
            EditorGUI.showMixedValue = nprLitDebugMode.hasMixedValue;
            int debugMode = EditorGUILayout.IntPopup(
                Styles.nprLitDebugMode,
                (int)nprLitDebugMode.floatValue,
                Styles.nprLitDebugModeNames,
                Styles.nprLitDebugModeValues);
            EditorGUI.showMixedValue = false;

            if (EditorGUI.EndChangeCheck() && (debugMode != (int)nprLitDebugMode.floatValue || nprLitDebugMode.hasMixedValue))
            {
                materialEditor.RegisterPropertyChangeUndo(Styles.nprLitDebugMode.text);
                nprLitDebugMode.floatValue = debugMode;
            }
            MaterialEditor.EndProperty();
        }

        void SetDefaultIblReflectionCubeMapIfNeeded()
        {
            if (iblReflectionCubeMap.hasMixedValue || iblReflectionCubeMap.textureValue != null)
                return;

            iblReflectionCubeMap.textureValue = AssetDatabase.LoadAssetAtPath<Texture>(kDefaultIblReflectionCubeMapPath);
        }
    }
}
