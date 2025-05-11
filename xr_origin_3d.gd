extends XROrigin3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if false and ax_button:
		(get_parent() as Minecart).velocity = 10
	pass

var ax_button:bool = false
func _on_left_hand_button_pressed(name: String) -> void:
	print("Button Pressed: " + name)
	if name == "by_button":
		var hmd:Node3D = get_node("XRCamera3D")
		
		position = -hmd.position
		position.y = 0
		rotation.y = -hmd.rotation.y
		position = position.rotated(Vector3(0,1,0),hmd.rotation.y)
		#position.z *= -1
		#position.x *= -1
		#print("tet")
	if name == "ax_button":
		ax_button = true
	pass # Replace with function body.


func _on_left_hand_button_released(name: String) -> void:
	if name == "ax_button":
		ax_button = false
	pass # Replace with function body.
