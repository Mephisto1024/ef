using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

namespace UnityEditor.Rendering.HighDefinition
{
    /// <summary>
    /// The UI block that displays NPR diffuse ramp inputs.
    /// </summary>
    public class NprDiffuseRampUIBlock : MaterialUIBlock
    {
        internal class Styles
        {
            public static readonly GUIContent header = EditorGUIUtility.TrTextContent("Diffuse Ramp Inputs");

            public static GUIContent diffuseRampMap = new GUIContent("Diffuse Ramp Map", "");
        }

        const string kDiffuseRampMap = "_DiffuseRampMap";

        MaterialProperty diffuseRampMap = null;

        /// <summary>
        /// Constructs an NPR diffuse ramp UI block.
        /// </summary>
        /// <param name="expandableBit">Bit index used to store the foldout state.</param>
        public NprDiffuseRampUIBlock(ExpandableBit expandableBit)
            : base(expandableBit, Styles.header)
        {
        }

        /// <summary>
        /// Loads the material properties for the block.
        /// </summary>
        public override void LoadMaterialProperties()
        {
            diffuseRampMap = FindProperty(kDiffuseRampMap, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (diffuseRampMap == null)
                return;

            materialEditor.TexturePropertySingleLine(Styles.diffuseRampMap, diffuseRampMap);
        }
    }
}
