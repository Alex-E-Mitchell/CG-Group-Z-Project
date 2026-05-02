extends Control

@export_category("Lights")
@export var directional_light: DirectionalLight3D
@export var world_environment: WorldEnvironment

var ambient_enabled := true
var specular_enabled := true
var diffuse_enabled := true

var saved_light_energy: float = 1.0

func _ready() -> void:
	var env := world_environment.environment

	ambient_enabled = env.ambient_light_sky_contribution > 0.0
	specular_enabled = directional_light.light_specular > 0.0
	diffuse_enabled = directional_light.light_energy > 0.0

	saved_light_energy = directional_light.light_energy


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_toggle_ambient_pressed() -> void:
	var env := world_environment.environment

	ambient_enabled = !ambient_enabled

	if ambient_enabled:
		env.ambient_light_sky_contribution = 1.0
	else:
		env.ambient_light_sky_contribution = 0.0


func _on_toggle_specular_pressed() -> void:
	specular_enabled = !specular_enabled

	if specular_enabled:
		directional_light.light_specular = 1.0
	else:
		directional_light.light_specular = 0.0


func _on_toggle_diffuse_pressed() -> void:
	diffuse_enabled = !diffuse_enabled

	if diffuse_enabled:
		directional_light.light_energy = saved_light_energy
	else:
		saved_light_energy = directional_light.light_energy
		directional_light.light_energy = 0.0
