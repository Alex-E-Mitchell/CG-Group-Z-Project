extends Area3D

@export var time_penalty: float = 5.0
@export var cooldown_time: float = 1.0

var can_damage := true

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		return
	
	if not can_damage:
		return
	
	can_damage = false
	
	get_tree().call_group("game_timer", "add_time", time_penalty)
	
	await get_tree().create_timer(cooldown_time).timeout
	can_damage = true
