extends AnimatableBody3D

@export var rotation_speed: float = 1.0

func _physics_process(delta: float) -> void:
	rotate_z(rotation_speed * delta)
