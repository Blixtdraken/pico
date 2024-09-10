@tool
extends PathFollow3D



@export
var gravity:float = 9.82
@export
var friction:float = 0.1
@export
var debug:bool = false
@export
var velocity:float = 0
@export
var acceleration:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if debug or not Engine.is_editor_hint():
		var angle:float = rotation_degrees.x
		print(sin(angle))
		print(cos(angle) * friction)
		acceleration = gravity * (sin(angle) - friction * cos(angle)) * delta
		print(acceleration)
		velocity += acceleration  * delta
		velocity *= friction 
		
		progress += velocity
		#var speed = 4 + (pow(1.07,rotation_degrees.x*-1))
		#if rotation.x > 0:
		#	speed = 4
		#progress += delta*speed
		#print(speed)
	else: 
		progress = 0
	pass
