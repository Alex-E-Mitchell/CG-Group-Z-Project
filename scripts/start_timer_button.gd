extends Area3D

signal timer_started

var already_pressed := false

func _ready() -> void:
	# Connect by code too, just in case the editor connection is weird.
	# This avoids double-connecting if it is already connected.
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if already_pressed:
		return

	if body.name != "Player":
		return

	already_pressed = true
	print("Timer started!")
	timer_started.emit()


func reset_button() -> void:
	already_pressed = false
	print("Timer button reset.")


func _on_timer_started() -> void:
	pass
