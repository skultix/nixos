{ ... }: let
ease-out-expo = duration: {
	easing.curve = "ease-out-expo";
	easing.duration-ms = duration;
};

window-open-close-anim-duration = 1000;
in {
	programs.niri.settings.animations = {
		window-open = {
			enable = true;
			kind = ease-out-expo window-open-close-anim-duration;
			custom-shader = ''
			float ease_curve(float x) {
                return x < 0.5 ? 4.0*x*x*x : 1.0 - pow(-2.0*x + 2.0, 3.0)/2.0;
            }

            vec4 open_color(vec3 coords_geo, vec3 size_geo) {
                float t = niri_clamped_progress;
                float prog = ease_curve(t);

                // choose corner: 0=top-left,1=top-right,2=bottom-left,3=bottom-right

                int corner = 3;
                vec2 start;
                vec2 dir;
                if (corner == 0) {
                    start = vec2(0.0,0.0);
                    dir = vec2(1.0,1.0);
                } else if (corner == 1) {
                    start = vec2(1.0,0.0);
                    dir = vec2(-1.0,1.0);
                } else if (corner == 2) {
                    start = vec2(0.0,1.0);
                    dir = vec2(1.0,-1.0);
                } else {
                    start = vec2(1.0,1.0);
                    dir = vec2(-1.0,-1.0);
                }

				// compute distance along diagonal from corner
				vec2 p = coords_geo.xy;
				float dist = dot(p - start, dir);

				// normalize distance to max diagonal (from corner to opposite)
				float max_diag = 2.0;
				float norm_dist = dist / max_diag;

				// pixels not yet reached by sweep are invisible
				if (norm_dist > prog) {
					return vec4(0.0);
				}

				// sample normally
				vec3 coords_tex = niri_geo_to_tex * coords_geo;
				vec4 col = texture2D(niri_tex, coords_tex.xy);

				return col;
			}
			'';
		};
		window-close = {
			enable = true;
			kind = ease-out-expo window-open-close-anim-duration;
			custom-shader = ''
            float ease_curve(float x) {
                return x < 0.5 ? 4.0*x*x*x : 1.0 - pow(-2.0*x + 2.0, 3.0)/2.0;
            }

            vec4 close_color(vec3 coords_geo, vec3 size_geo) {
                float t = niri_clamped_progress;


                float prog = ease_curve(t);

                // choose corner: 0=top-left,1=top-right,2=bottom-left,3=bottom-right

                int corner = 0;
                vec2 start;
                vec2 dir;
                if (corner == 0) {
                    start = vec2(0.0,0.0);
                    dir = vec2(1.0,1.0);
                } else if (corner == 1) {
                    start = vec2(1.0,0.0);
                    dir = vec2(-1.0,1.0);
                } else if (corner == 2) {
                    start = vec2(0.0,1.0);
                    dir = vec2(1.0,-1.0);
                } else {
                    start = vec2(1.0,1.0);
                    dir = vec2(-1.0,-1.0);
                }

                float shadow_fix = 0.01; // otherwise the animation may stop before 
                // it hides the shadow, since it's outside the window bounds

                // compute distance along diagonal from corner

                vec2 p = coords_geo.xy;
                float dist = dot(p - start, dir) - shadow_fix;

                // normalize distance to max diagonal
                float max_diag = 2.0; // max of vec2(1,1)
                float norm_dist = dist / max_diag;


                // If pixel is behind the sweeping line, make it invisible

                if (norm_dist <= prog) {
                    return vec4(0.0);
                }

                // sample normally
                vec3 coords_tex = niri_geo_to_tex * coords_geo;
                vec4 col = texture2D(niri_tex, coords_tex.xy);

                return col;
            }
			'';
		};
	};
}
