extends Node3D



func _ready():
	var xr_interface : OpenXRInterface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
