shader_type spatial;
render_mode unshaded, depth_prepass_alpha, depth_draw_opaque;
uniform sampler2D TEXTURES:filter_nearest_mipmap_anisotropic;
varying vec3 vert_normal;
uniform float ratio:hint_range(0.0, 1.0, 0.01);
void vertex() {
	// Called for every vertex the material is visible on.
	vert_normal = NORMAL;
}

void fragment() {
	vec4 color = texture(TEXTURES, UV);
	//ALBEDO = color.rgb;
	
	float vert_float = (vert_normal.x*1.5 + vert_normal.y*1.2 + vert_normal.z*1.5)/2.5;
	//ALBEDO = 0.9 * color.rgb - vec3((vert_float)*0.05) * vec3(1);
	ALPHA = color.a;

	ALBEDO = abs(vert_float) * vec3(1)*abs(vert_normal.y-0.5);
	ALBEDO *= color.rgb*3.0;
	
	ALBEDO = color.rgb / ratio*vec3((vert_float + 1.0)/2.0);
	ALBEDO = vec3(vert_float);
	ALBEDO = abs(vec3(vert_normal.x*1.0 , vert_normal.y*1.0, vert_normal.z*1.0));
	
	
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
