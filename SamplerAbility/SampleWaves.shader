shader_type canvas_item;

uniform vec2 center;
uniform float force;
uniform float max_size;
uniform float thickness;

void fragment() {
	/*float ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	vec2 scaledUV = (SCREEN_UV - vec2(0.5, 0.0) ) / vec2(ratio, 1.0) + vec2(0.5, 0.0);
	float mask = ( 1.0 - smoothstep(size-0.1, size, length(scaledUV - center)) ) * 
			smoothstep(size-thickness-0.1, size-thickness, length(scaledUV - center));
	vec2 disp = normalize(SCREEN_UV - center) * force * mask;
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV - disp);
	COLOR.rgb = vec3(mask);*/
	float loop = TIME / 2.0 - floor(TIME / 2.0);
	vec2 centered_uv = UV - vec2(0.5, 0.5);
	float size = max_size * loop;
	float mask = (1.0 - smoothstep(size-0.1, size, length(centered_uv)) )* 
			smoothstep(size-thickness-0.1, size-thickness, length(centered_uv));
	float fade_cone = clamp(0.5 - length(centered_uv), 0.0, 1.0);
	//COLOR.rgb = vec3(fade_cone);
	vec2 disp = normalize(centered_uv) * force * mask * fade_cone;
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV - disp);
	//float mask = length(UV - vec2(0.5, 0.5));
	//COLOR = vec4(disp, 0.0, 1.0);
	//COLOR = vec4(centured_uv, 0.0, 1.0);
}