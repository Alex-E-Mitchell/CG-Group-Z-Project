extends Area3D

@export var world_sky: Sky
@export var normal_environment: PanoramaSkyMaterial
@export var alternate_environment: PanoramaSkyMaterial
@export var directional_light: DirectionalLight3D

func _ready() -> void:
	world_sky.sky_material = normal_environment
	
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		return
	
	if world_sky.sky_material == normal_environment:
		world_sky.sky_material = alternate_environment
		directional_light.light_energy = 0.1
		directional_light.light_specular = 0.00
	else:
		world_sky.sky_material = normal_environment
		directional_light.light_energy = 1.0
		directional_light.light_specular = 1.0

	
