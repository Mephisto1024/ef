void P5Initialize(inout VFXAttributes attributes)
{
    attributes.lifetime = 100000.0;
    attributes.velocity = float3(0.0, 0.0, 0.0);
    attributes.color = float3(1.0, 1.0, 1.0);
    attributes.alpha = 0.38;
    attributes.size = 0.015;
}

void P5Animate(inout VFXAttributes attributes, in float timeSeconds, in float scale, in float3 center)
{
    uint id = attributes.particleId % 20000u;
    float y = (float)id / 500.0;
    float t = timeSeconds * 0.5235987755982989;

    float k = cos(y * 5.0) * (y < 11.0 ? 21.0 : 11.0);
    float e = y / 8.0 - 13.0;
    float o = length(float2(k, e)) / 6.0;
    float safeK = abs(k) < 0.0001 ? (k < 0.0 ? -0.0001 : 0.0001) : k;

    float q = k * 2.0 + 49.0 + cos(y) / safeK
        + k * cos(y / 2.0) * (1.0 + sin(o * 4.0 - e / 2.0 - t));
    float c = o / 1.5 - e / 5.0 - t / 8.0 + (float)(id % 3u) * 8.0;
    float2 pixel = float2(
        q * sin(c) + 200.0,
        230.0 + q * cos(c) - 79.0 * sin(c / 2.0)
    );
    float visible = step(0.0, pixel.x) * step(pixel.x, 400.0) * step(0.0, pixel.y) * step(pixel.y, 400.0);
    float2 centered = (pixel - float2(200.0, 200.0)) * scale;
    float depth = (sin(c * 1.37 + y * 0.71) * abs(q) * 0.35 + cos(o * 5.0 - t) * 18.0) * scale * visible;

    attributes.position = lerp(center, center + float3(centered.x, -centered.y, depth), visible);
    attributes.velocity = float3(0.0, 0.0, 0.0);
    attributes.color = float3(1.0, 1.0, 1.0);
    attributes.alpha = 0.38 * visible;
}
