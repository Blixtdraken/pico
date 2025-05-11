@tool
extends PathFollow3D

class_name Minecart

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
@export
var climb_speed:float = 3
@export
var climb_transition_speed:float = 15
@onready
var climb_timer:Timer = get_node("ClimbTimer")

@export
var climb_delay_done:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#climb_timer.timeout.connect(_climb_timer_timeout)
	pass # Replace with function body.

func _climb_timer_timeout():
	print("timed out")
	climb_delay_done = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if debug or not Engine.is_editor_hint():
		#print(climb_timer.time_left)
		
		var angle:float = -rotation.x
		
		#print("Friction: " + str(friction*cos(angle)))
		#print("Acc: " + str(sin(angle)))

		acceleration = gravity*sin(angle) - gravity*(friction*cos(angle))
		
		velocity += acceleration*delta
		
		if angle <= 0 and velocity < 0:
			#print("might start")
			if climb_timer.is_stopped():
				print("startin")
				climb_timer.start()
		elif angle >= 0 and velocity > 0:
				climb_timer.stop()
				climb_delay_done = false
		
		if climb_delay_done:	
			velocity = move_toward(velocity,climb_speed,delta*climb_transition_speed)
		
		progress += velocity*delta
		#print(progress)
		#var speed = 4 + (pow(1.07,rotation_degrees.x*-1))
		#if rotation.x > 0:
		#	speed = 4
		#progress += delta*speed
		#print(speed)
	else: 
		progress = 0
		velocity = 0
		acceleration = 0
	pass
	
