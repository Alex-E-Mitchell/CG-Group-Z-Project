extends AnimatableBody3D

signal star_collected

@export var rotation_speed_degrees: float = 90.0
@export var bob_height: float = 0.4
@export var bob_speed: float = 2.0
@export var star_scale: float = 2.0

@onready var collect_area: Area3D = $CollectArea

var start_position: Vector3
var time_passed: float = 0.0
var spin_angle: float = 0.0
var already_collected := false

func _ready() -> void:
	start_position = global_position

	# Connect the CollectArea signal through code.
	# This makes sure the star can detect when the player touches it.
	if not collect_area.body_entered.is_connected(_on_collect_area_body_entered):
		collect_area.body_entered.connect(_on_collect_area_body_entered)


func _physics_process(delta: float) -> void:
	time_passed += delta
	spin_angle += deg_to_rad(rotation_speed_degrees) * delta

	var bob_offset := sin(time_passed * bob_speed) * bob_height

	var new_transform := Transform3D()
	new_transform.origin = start_position + Vector3(0, bob_offset, 0)
	new_transform.basis = Basis(Vector3.UP, spin_angle).scaled(Vector3.ONE * star_scale)

	global_transform = new_transform


func _on_collect_area_body_entered(body: Node3D) -> void:
	if already_collected:
		return

	if body.name != "Player":
		return

	already_collected = true
	print("Star collected!")
	star_collected.emit()
