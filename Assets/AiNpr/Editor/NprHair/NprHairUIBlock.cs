using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

namespace UnityEditor.Rendering.HighDefinition
{
    /// <summary>
    /// The UI block that displays NPR hair inputs.
    /// </summary>
    public class NprHairUIBlock : MaterialUIBlock
    {
        internal class Styles
        {
            public static readonly GUIContent header = EditorGUIUtility.TrTextContent("Hair Inputs");

            public static GUIContent hairStrandMap = new GUIContent("Hair Strand Map", "Specifies the strand mask texture for NPR hair.");
            public static GUIContent hairSpecularLutMap = new GUIContent("Hair SpecularLut Map", "");
            public static GUIContent nprHairDebugEnabled = new GUIContent("Enable Intermediate Debug", "Overrides the hair color with a selected intermediate value.");
            public static GUIContent nprHairDebugMode = new GUIContent("Intermediate Debug Mode", "Selects which NPR hair intermediate value is shown.");
            public static readonly GUIContent[] nprHairDebugModeNames =
            {
                new GUIContent("None"),
                new GUIContent("TextureSample/baseColor"),
                new GUIContent("TextureSample/materialAlpha"),
                new GUIContent("TextureSample/flowBlendMask"),
                new GUIContent("TextureSample/primarySpecMask"),
                new GUIContent("TextureSample/lightOcclusionMask"),
                new GUIContent("TextureSample/strandMaskSample.xxx"),
                new GUIContent("TextureSample/normalWS"),
                new GUIContent("TextureSample/secondaryNormalWS"),
                new GUIContent("TextureSample/tangentWS"),
                new GUIContent("TextureSample/hairTangentWS"),
                new GUIContent("Lighting/sceneShadow"),
                new GUIContent("Lighting/characterSelfShadow"),
                new GUIContent("Lighting/diffuseHair"),
                new GUIContent("Lighting/primarySpecResult"),
                new GUIContent("Lighting/secondarySpec"),
            };
            public static readonly int[] nprHairDebugModeValues =
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
            };
        }

        const string kHairStrandMap = "_HairStrandMap";
        const string kHairSpecularLutMap = "_HairSpecularLutMap";
        const string kNprHairDebugEnabled = "_NprHairDebugEnabled";
        const string kNprHairDebugMode = "_NprHairDebugMode";

        MaterialProperty hairStrandMap = null;
        MaterialProperty hairSpecularLutMap = null;
        MaterialProperty nprHairDebugEnabled = null;
        MaterialProperty nprHairDebugMode = null;

        /// <summary>
        /// Constructs an NPR hair UI block.
        /// </summary>
        /// <param name="expandableBit">Bit index used to store the foldout state.</param>
        public NprHairUIBlock(ExpandableBit expandableBit)
            : base(expandableBit, Styles.header)
        {
        }

        /// <summary>
        /// Loads the material properties for the block.
        /// </summary>
        public override void LoadMaterialProperties()
        {
            hairStrandMap = FindProperty(kHairStrandMap, false);
            hairSpecularLutMap = FindProperty(kHairSpecularLutMap, false);
            nprHairDebugEnabled = FindProperty(kNprHairDebugEnabled, false);
            nprHairDebugMode = FindProperty(kNprHairDebugMode, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (hairStrandMap == null)
                return;

            materialEditor.TexturePropertySingleLine(Styles.hairStrandMap, hairStrandMap);
            materialEditor.TextureScaleOffsetProperty(hairStrandMap);

            materialEditor.TexturePropertySingleLine(Styles.hairSpecularLutMap, hairSpecularLutMap);

            if (nprHairDebugEnabled == null || nprHairDebugMode == null)
                return;

            materialEditor.ShaderProperty(nprHairDebugEnabled, Styles.nprHairDebugEnabled);

            if (nprHairDebugEnabled.floatValue <= 0.5f && !nprHairDebugEnabled.hasMixedValue)
                return;

            MaterialEditor.BeginProperty(nprHairDebugMode);
            EditorGUI.BeginChangeCheck();
            EditorGUI.showMixedValue = nprHairDebugMode.hasMixedValue;
            int debugMode = EditorGUILayout.IntPopup(
                Styles.nprHairDebugMode,
                (int)nprHairDebugMode.floatValue,
                Styles.nprHairDebugModeNames,
                Styles.nprHairDebugModeValues);
            EditorGUI.showMixedValue = false;

            if (EditorGUI.EndChangeCheck() && (debugMode != (int)nprHairDebugMode.floatValue || nprHairDebugMode.hasMixedValue))
            {
                materialEditor.RegisterPropertyChangeUndo(Styles.nprHairDebugMode.text);
                nprHairDebugMode.floatValue = debugMode;
            }
            MaterialEditor.EndProperty();
        }
    }
}
