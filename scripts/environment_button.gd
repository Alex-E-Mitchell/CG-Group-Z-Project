extends Area3D

@export var world_sky: Sky
@export var normal_environment: PanoramaSkyMaterial
@export var alternate_environment: PanoramaSkyMaterial



func _ready() -> void:
	world_sky.sky_material = normal_environment
	
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		return
	
	if world_sky.sky_material == normal_environment:
		world_sky.sky_material = alternate_environment
	else:
		world_sky.sky_material = normal_environment

	
