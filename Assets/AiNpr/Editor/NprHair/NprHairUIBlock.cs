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
        }

        const string kHairStrandMap = "_HairStrandMap";

        MaterialProperty hairStrandMap = null;

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
        }
    }
}
