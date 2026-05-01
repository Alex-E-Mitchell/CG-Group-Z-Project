extends AnimatableBody3D

@export var move_distance: float = 5.0
@export var move_speed: float = 2.0

# Check this in the Inspector to make this platform move the opposite way
@export var reverse_direction: bool = false

var start_position: Vector3
var target_position: Vector3
var moving_to_target := true

func _ready() -> void:
	start_position = global_position
	
	var direction := Vector3(0, 0, move_distance)
	
	if reverse_direction:
		direction *= -1
	
	target_position = start_position + direction


func _physics_process(delta: float) -> void:
	var destination: Vector3

	if moving_to_target:
		destination = target_position
	else:
		destination = start_position

	global_position = global_position.move_toward(destination, move_speed * delta)

	if global_position.distance_to(destination) < 0.01:
		moving_to_target = !moving_to_target
