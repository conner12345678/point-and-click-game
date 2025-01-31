shader_type canvas_item;

uniform vec4 tint_color;


void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	COLOR = tex_color * tint_color;
}
