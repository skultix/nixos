{ ... }: {
	environment.sessionVariables = {
		PROTON_ENABLE_WAYLAND = 1;
		PROTON_ENABLE_HDR = 1;
		DXVK_HDR = 1;
	};
}
