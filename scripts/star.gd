extends AnimatableBody3D

@export var rotation_speed_degrees: float = 90.0
@export var bob_height: float = 0.4
@export var bob_speed: float = 2.0
@export var star_scale: float = 2.0

var start_position: Vector3
var time_passed: float = 0.0
var spin_angle: float = 0.0

func _ready() -> void:
	start_position = global_position


func _physics_process(delta: float) -> void:
	time_passed += delta
	spin_angle += deg_to_rad(rotation_speed_degrees) * delta

	var bob_offset := sin(time_passed * bob_speed) * bob_height

	var new_transform := Transform3D()
	new_transform.origin = start_position + Vector3(0, bob_offset, 0)
	new_transform.basis = Basis(Vector3.UP, spin_angle).scaled(Vector3.ONE * star_scale)

	global_transform = new_transform
