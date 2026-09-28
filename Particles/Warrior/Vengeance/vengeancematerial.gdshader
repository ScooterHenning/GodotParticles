shader_type spatial;
render_mode unshaded, cull_disabled, blend_mix;

uniform sampler2D shield_texture : source_color, filter_nearest;
uniform float opacity : hint_range(0.0, 1.0) = 0.6;

void fragment() {
    vec4 tex = texture(shield_texture, UV);

    ALBEDO = tex.rgb;
    EMISSION = tex.rgb * 1.5;
    ALPHA = tex.a * opacity;
}