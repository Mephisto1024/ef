using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
using RendererListDesc = UnityEngine.Rendering.RendererUtils.RendererListDesc;

namespace UnityEngine.Rendering.HighDefinition
{
    class OutlineCustomPass : DrawRenderersCustomPass
    {
        const string OutlineShaderTagName = "Outline";

        ShaderTagId[] outlineShaderTags;

        protected override void Setup(ScriptableRenderContext renderContext, CommandBuffer cmd)
        {
            overrideMode = OverrideMaterialMode.None;
            outlineShaderTags = new[] { new ShaderTagId(OutlineShaderTagName) };

            base.Setup(renderContext, cmd);
        }

        protected override void Execute(CustomPassContext ctx)
        {
            var shaderPasses = outlineShaderTags;


            if (shaderPasses.Length == 0)
            {
                Debug.LogWarning(
                    "Attempt to call DrawRenderers with an empty shader passes. Skipping the call to avoid errors");
                return;
            }

            var mask = overrideDepthState ? RenderStateMask.Depth : 0;
            mask |= overrideDepthState && !depthWrite ? RenderStateMask.Stencil : 0;
            if (overrideStencil)
                mask |= RenderStateMask.Stencil;
            var stateBlock = new RenderStateBlock(mask)
            {
                depthState = new DepthState(depthWrite, depthCompareFunction),
                // We disable the stencil when the depth is overwritten but we don't write to it, to prevent writing to the stencil.
                stencilState = new StencilState(overrideStencil, (byte)stencilReadMask, (byte)stencilWriteMask,
                    stencilCompareFunction, stencilPassOperation, stencilFailOperation, stencilDepthFailOperation),
                stencilReference = overrideStencil ? stencilReferenceValue : 0,
            };

            PerObjectData renderConfig = HDUtils.GetRendererConfiguration(
                ctx.hdCamera.frameSettings.IsEnabled(FrameSettingsField.ProbeVolume),
                ctx.hdCamera.frameSettings.IsEnabled(FrameSettingsField.Shadowmask));
            var overrideShaderMaterial = (overrideShader != null) ? new Material(overrideShader) : null;

            var result = new RendererUtils.RendererListDesc(shaderPasses, ctx.cullingResults, ctx.hdCamera.camera)
            {
                rendererConfiguration = renderConfig,
                renderQueueRange = GetRenderQueueRange(renderQueueType),
                sortingCriteria = sortingCriteria,
                excludeObjectMotionVectors = false,
                overrideShader = overrideMode == OverrideMaterialMode.Shader ? overrideShader : null,
                overrideMaterial = overrideMode == OverrideMaterialMode.Material ? overrideMaterial : null,
                overrideMaterialPassIndex =
                    (overrideMaterial != null) ? overrideMaterial.FindPass(overrideMaterialPassName) : 0,
                overrideShaderPassIndex = (overrideShader != null)
                    ? overrideShaderMaterial.FindPass(overrideShaderPassName)
                    : 0,
                stateBlock = stateBlock,
                layerMask = layerMask,
            };

            Object.DestroyImmediate(overrideShaderMaterial);
            var renderCtx = ctx.renderContext;
            var rendererList = renderCtx.CreateRendererList(result);
            bool opaque = renderQueueType == RenderQueueType.AllOpaque ||
                          renderQueueType == RenderQueueType.OpaqueAlphaTest ||
                          renderQueueType == RenderQueueType.OpaqueNoAlphaTest;
            HDRenderPipeline.RenderForwardRendererList(ctx.hdCamera.frameSettings, rendererList, opaque,
                ctx.renderContext, ctx.cmd);
        }

        protected override void Cleanup()
        {
            base.Cleanup();
        }
    }
}
