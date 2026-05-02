extends AnimatableBody3D

@export var move_distance: float = 5.0
@export var move_speed: float = 2.0
@export var start_moving_forward: bool = true
@export var reverse_direction: bool = false

var start_position: Vector3
var target_position: Vector3
var moving_to_target: bool

func _ready() -> void:
	start_position = global_position

	var z_direction := -1.0 if reverse_direction else 1.0
	target_position = start_position + Vector3(0, 0, move_distance * z_direction)

	moving_to_target = start_moving_forward


func _physics_process(delta: float) -> void:
	var destination := target_position if moving_to_target else start_position

	global_position = global_position.move_toward(destination, move_speed * delta)

	if global_position.distance_to(destination) < 0.01:
		moving_to_target = !moving_to_target
