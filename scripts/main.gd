extends Node3D

@onready var player: CharacterBody3D = $Player
@onready var timer_button: Area3D = $TimerButton
@onready var timer_ui: CanvasLayer = $TimerUI
@onready var star: AnimatableBody3D = $Star

func _ready() -> void:
	timer_button.timer_started.connect(_on_timer_started)
	star.star_collected.connect(_on_star_collected)
	player.player_respawned.connect(_on_player_respawned)


func _on_timer_started() -> void:
	timer_ui.start_timer()


func _on_star_collected() -> void:
	timer_ui.stop_timer()
	print("Final time: ", timer_ui.timer_label.text)


func _on_player_respawned() -> void:
	timer_button.reset_button()
	timer_ui.reset_timer()
