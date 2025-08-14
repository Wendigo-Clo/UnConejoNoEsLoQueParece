shader_type canvas_item;

uniform float progress = 0.0; // controla cuánto se muestra (1 = todo visible, 0 = nada visible)

void fragment() {
    vec2 uv = UV;

    // Si la coordenada horizontal del píxel es mayor que "progress",
    // descartamos el píxel (transparente)
    if (uv.x < progress) {
        discard;
    }
    
    COLOR = texture(TEXTURE, uv);
}
