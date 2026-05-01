extends AnimatableBody3D

@export var rotation_speed_degrees: float = 90.0

# Check this in the Inspector to make this swiper rotate the opposite direction
@export var reverse_direction: bool = false

func _physics_process(delta: float) -> void:
	var direction := 1.0
	
	if reverse_direction:
		direction = -1.0
	
	rotate_y(deg_to_rad(rotation_speed_degrees) * direction * delta)
