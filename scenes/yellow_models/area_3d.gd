extends Area3D

@export var target_platform: GeometryInstance3D 
@export var new_color: Color = Color(0, 1, 0) # Defaults to bright green

func _ready() -> void:
	# This automatically connects the trigger
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	# Check if the thing that stepped on the platform is the Player
	if body.name == "Player":
		change_diffuse_color()

func change_diffuse_color() -> void:
	if target_platform:
		# Create a brand new material
		var new_material = StandardMaterial3D.new()
		
		# Change its Albedo (Diffuse) to our chosen color
		new_material.albedo_color = new_color
		
		# Apply the material to override the platform's current look
		target_platform.material_override = new_material
		
func reset_color() -> void:
	if target_platform:
		# Setting it to null removes our custom color and reveals the original yellow
		target_platform.material_override = null
