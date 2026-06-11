/*
    Bake Fur Shell UV for zhouxue fur shader

    Usage:
    1. Select one mesh / editable poly object in 3ds Max.
    2. Run this script.
    3. Press "Bake Shell Mesh".

    Result:
    - Creates a new combined mesh with shellCount copies of the source mesh.
    - Writes shell layer value to Map Channel 4 by default:
          uv4.xy = (layerIndex + 1) / shellCount
      This matches:
          layout(location = 4) in vec2 inFurUv;
    - Geometry is not offset in Max. The shader offsets shells at runtime.
*/

global BakeFurShellUvRollout

fn ensureMeshMapChannel targetMesh mapChannel =
(
    -- New mesh objects usually only expose map channels up to 1.
    -- Extend the channel table before enabling UV2/UV3/UV4/etc.
    local requiredMapCount = mapChannel + 1
    if (meshop.getNumMaps targetMesh) < requiredMapCount do
    (
        meshop.setNumMaps targetMesh requiredMapCount keep:true
    )
    meshop.setMapSupport targetMesh mapChannel true
)

fn bakeFurShellUv sourceNode shellCount:19 furMapChannel:4 copyUv1:true outputName:"fur_shell_baked" =
(
    if sourceNode == undefined do
    (
        messageBox "Please select one mesh object first." title:"Bake Fur Shell UV"
        return undefined
    )

    if shellCount < 1 do
    (
        messageBox "shellCount must be at least 1." title:"Bake Fur Shell UV"
        return undefined
    )

    if furMapChannel < 2 do
    (
        messageBox "Use map channel 2 or higher for fur shell data. Channel 1 is usually the base texture UV." title:"Bake Fur Shell UV"
        return undefined
    )

    local srcMesh = snapshotAsMesh sourceNode
    local srcVertCount = srcMesh.numverts
    local srcFaceCount = srcMesh.numfaces

    if srcVertCount == 0 or srcFaceCount == 0 do
    (
        srcMesh = undefined
        messageBox "Selected object has no mesh geometry." title:"Bake Fur Shell UV"
        return undefined
    )

    local totalVertCount = srcVertCount * shellCount
    local totalFaceCount = srcFaceCount * shellCount
    local outVerts = #()
    local outFaces = #()

    outVerts.count = totalVertCount
    outFaces.count = totalFaceCount

    for layerIndex = 0 to (shellCount - 1) do
    (
        local vertBase = layerIndex * srcVertCount
        local faceBase = layerIndex * srcFaceCount

        for v = 1 to srcVertCount do
        (
            outVerts[vertBase + v] = getVert srcMesh v
        )

        for f = 1 to srcFaceCount do
        (
            local srcFace = getFace srcMesh f
            outFaces[faceBase + f] = [srcFace.x + vertBase, srcFace.y + vertBase, srcFace.z + vertBase]
        )
    )

    local outMesh = mesh vertices:outVerts faces:outFaces name:outputName
    update outMesh

    -- Preserve material and face material ids.
    outMesh.material = sourceNode.material
    for layerIndex = 0 to (shellCount - 1) do
    (
        local faceBase = layerIndex * srcFaceCount
        for f = 1 to srcFaceCount do
        (
            local outFace = faceBase + f
            setFaceMatID outMesh outFace (getFaceMatID srcMesh f)
            setFaceSmoothGroup outMesh outFace (getFaceSmoothGroup srcMesh f)
        )
    )

    -- Optional: copy original UV channel 1 so the duplicated mesh still keeps its base texture coordinates.
    if copyUv1 and (meshop.getMapSupport srcMesh 1) do
    (
        local srcMapVertCount = meshop.getNumMapVerts srcMesh 1
        ensureMeshMapChannel outMesh 1
        meshop.setNumMapVerts outMesh 1 (srcMapVertCount * shellCount)
        meshop.setNumMapFaces outMesh 1 totalFaceCount

        for layerIndex = 0 to (shellCount - 1) do
        (
            local mapVertBase = layerIndex * srcMapVertCount
            local faceBase = layerIndex * srcFaceCount

            for mv = 1 to srcMapVertCount do
            (
                meshop.setMapVert outMesh 1 (mapVertBase + mv) (meshop.getMapVert srcMesh 1 mv)
            )

            for f = 1 to srcFaceCount do
            (
                local srcMapFace = meshop.getMapFace srcMesh 1 f
                meshop.setMapFace outMesh 1 (faceBase + f) [srcMapFace.x + mapVertBase, srcMapFace.y + mapVertBase, srcMapFace.z + mapVertBase]
            )
        )
    )

    -- Bake inFurUv into the requested map channel. Values are discrete shell layers:
    -- 1/19, 2/19, ... 19/19 when shellCount is 19.
    ensureMeshMapChannel outMesh furMapChannel
    meshop.setNumMapVerts outMesh furMapChannel totalVertCount
    meshop.setNumMapFaces outMesh furMapChannel totalFaceCount

    for layerIndex = 0 to (shellCount - 1) do
    (
        local vertBase = layerIndex * srcVertCount
        local faceBase = layerIndex * srcFaceCount
        local layerValue = (layerIndex + 1.0) / shellCount
        local furUv = [layerValue, layerValue, 0.0]

        for v = 1 to srcVertCount do
        (
            meshop.setMapVert outMesh furMapChannel (vertBase + v) furUv
        )

        for f = 1 to srcFaceCount do
        (
            local srcFace = getFace srcMesh f
            meshop.setMapFace outMesh furMapChannel (faceBase + f) [srcFace.x + vertBase, srcFace.y + vertBase, srcFace.z + vertBase]
        )
    )

    update outMesh
    srcMesh = undefined
    select outMesh
    outMesh
)

try (destroyDialog BakeFurShellUvRollout) catch()

rollout BakeFurShellUvRollout "Bake Fur Shell UV" width:260
(
    spinner spnShellCount "Shell Count: " range:[1,256,19] type:#integer fieldwidth:60 align:#left
    spinner spnMapChannel "Fur UV Map Channel: " range:[2,99,4] type:#integer fieldwidth:60 align:#left
    checkbox chkCopyUv1 "Copy base UV channel 1" checked:true
    editText edtOutputName "Output Name:" text:"zhouxue_fur_shell_baked" width:230
    button btnBake "Bake Shell Mesh" width:230 height:32

    on btnBake pressed do
    (
        if selection.count != 1 then
        (
            messageBox "Please select exactly one source mesh object." title:"Bake Fur Shell UV"
        )
        else
        (
            local resultNode = bakeFurShellUv selection[1] shellCount:spnShellCount.value furMapChannel:spnMapChannel.value copyUv1:chkCopyUv1.checked outputName:edtOutputName.text
            if resultNode != undefined do
            (
                format "Baked % shells into node: %\n" spnShellCount.value resultNode.name
                messageBox ("Created: " + resultNode.name + "\nFur UV baked into map channel " + (spnMapChannel.value as string) + ".") title:"Bake Fur Shell UV"
            )
        )
    )
)

createDialog BakeFurShellUvRollout
