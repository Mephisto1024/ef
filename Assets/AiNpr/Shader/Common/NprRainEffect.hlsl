float4 sampleRainRipplePlane(float2 rippleCoord, float rippleTime)
{
    float2 cell = floor(rippleCoord);
    float2 hashSeed = frac(cell * float2(123.34, 456.21));
    float2 hash = hashSeed + dot(hashSeed, hashSeed + 34.345001220703125);
    float2 random = frac(float2(hash.x * hash.y, hash.x + hash.y));

    float2 neighborHashSeed = frac((cell + 114.514) * float2(123.34, 456.21));
    float2 neighborHash = neighborHashSeed + dot(neighborHashSeed, neighborHashSeed + 34.345);
    float2 neighborRandom = frac(float2(neighborHash.x * neighborHash.y, neighborHash.x + neighborHash.y));

    float phaseSeed = random.x;
    float radius = 0.25 * lerp(0.6, 1.0, phaseSeed);
    float2 cellOffset = ((rippleCoord - cell) + (((neighborRandom * 2.0) - 1.0) * 0.25)) - 0.5;
    float offsetY = cellOffset.y;
    float2 ellipseOffset = float2(cellOffset.x * 1.25, offsetY * ((offsetY < 0.0) ? 1.25 : 0.75));

    float animatedPhase = frac(rippleTime + phaseSeed);
    float mask = (
        smoothstep(0.2, 0.22, animatedPhase) *
        smoothstep(0.85, 0.55, animatedPhase)
    ) * step(0.001, smoothstep(radius, 0.0, length(ellipseOffset)));

    float2 normalOffset = (
        clamp(ellipseOffset / radius, -1.0, 1.0) *
        step(0.001, mask)
    ) * lerp(0.25, 0.5, neighborRandom.x);

    return float4(normalOffset, mask, random.y);
}