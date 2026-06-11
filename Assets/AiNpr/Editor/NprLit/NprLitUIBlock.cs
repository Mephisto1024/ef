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

            public static GUIContent f0TintLutMap = new GUIContent("F0 Tint LUT Map", "Specifies the F0 tint lookup texture for NPR lit.");
        }

        const string kF0TintLutMap = "_F0TintLutMap";

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
            f0TintLutMap = FindProperty(kF0TintLutMap, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (f0TintLutMap == null)
                return;

            materialEditor.TexturePropertySingleLine(Styles.f0TintLutMap, f0TintLutMap);
        }
    }
}
