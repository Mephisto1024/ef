using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

namespace UnityEditor.Rendering.HighDefinition
{
    /// <summary>
    /// The UI block that displays NPR rain effect inputs.
    /// </summary>
    public class NprRainEffectUIBlock : MaterialUIBlock
    {
        internal class Styles
        {
            public static readonly GUIContent header = EditorGUIUtility.TrTextContent("Rain Effect Inputs");

            public static GUIContent perObjectWetness = new GUIContent("Per Object Wetness", "");
            public static GUIContent rainLayerAMap = new GUIContent("Rain Layer A Map", "");
            public static GUIContent rainLayerBMap = new GUIContent("Rain Layer B Map", "");
            public static GUIContent rainLayerTilling = new GUIContent("Rain Layer Tilling", "");
        }

        const string kPerObjectWetness = "_PerObjectWetness";
        const string kRainLayerAMap = "_RainLayerAMap";
        const string kRainLayerBMap = "_RainLayerBMap";
        const string kRainLayerTilling = "_RainLayerTilling";

        MaterialProperty perObjectWetness = null;
        MaterialProperty rainLayerAMap = null;
        MaterialProperty rainLayerBMap = null;
        MaterialProperty rainLayerTilling = null;

        /// <summary>
        /// Constructs an NPR rain effect UI block.
        /// </summary>
        /// <param name="expandableBit">Bit index used to store the foldout state.</param>
        public NprRainEffectUIBlock(ExpandableBit expandableBit)
            : base(expandableBit, Styles.header)
        {
        }

        /// <summary>
        /// Loads the material properties for the block.
        /// </summary>
        public override void LoadMaterialProperties()
        {
            perObjectWetness = FindProperty(kPerObjectWetness, false);
            rainLayerAMap = FindProperty(kRainLayerAMap, false);
            rainLayerBMap = FindProperty(kRainLayerBMap, false);
            rainLayerTilling = FindProperty(kRainLayerTilling, false);
        }

        /// <summary>
        /// GUI callback when the header is open.
        /// </summary>
        protected override void OnGUIOpen()
        {
            if (perObjectWetness == null && rainLayerAMap == null && rainLayerBMap == null && rainLayerTilling == null)
                return;

            if (perObjectWetness != null)
                materialEditor.ShaderProperty(perObjectWetness, Styles.perObjectWetness);

            if (rainLayerAMap != null)
            {
                NprMaterialPropertyUtility.SetDefaultTextureIfNeeded(rainLayerAMap, "Assets/AiNpr/Texture/RainLayerA.png");
                materialEditor.TexturePropertySingleLine(Styles.rainLayerAMap, rainLayerAMap);
            }
                

            if (rainLayerBMap != null)
            {
                NprMaterialPropertyUtility.SetDefaultTextureIfNeeded(rainLayerBMap, "Assets/AiNpr/Texture/RainLayerB.png");
                materialEditor.TexturePropertySingleLine(Styles.rainLayerBMap, rainLayerBMap);
            }

            if (rainLayerTilling != null)
                materialEditor.ShaderProperty(rainLayerTilling, Styles.rainLayerTilling);
        }
    }
}
