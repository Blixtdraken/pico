extends XRController3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_input_float_changed(name: String, value: float) -> void:
	print(name + " : " + str(value))
	pass # Replace with function body.


func _on_input_vector_2_changed(name: String, value: Vector2) -> void:
	print(name + " : " + str(value))
	pass # Replace with function body.
