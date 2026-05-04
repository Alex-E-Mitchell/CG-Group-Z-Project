extends Area3D

@export var rotation_speed: float = 2.0
@export var time_bonus: float = 5.0

# This variable keeps track of whether the star is currently "collected"
var is_collected := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(_delta: float) -> void:
	if not is_collected:
		#rotate_y(rotation_speed * delta)
		
		var pulse_wave = sin(Time.get_ticks_msec() * 0.005) 
		var current_scale = 1.0 + (pulse_wave * 0.1)
		
		scale = Vector3(current_scale, current_scale, current_scale)

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not is_collected:
		collect()

func collect() -> void:
	is_collected = true
	print("Heart collected!")
	hide() # This makes the star invisible
	# We turn off the collision so the player doesn't keep hitting it while invisible
	$CollisionShape3D.set_deferred("disabled", true)
	
	get_tree().call_group("game_timer", "reduce_time", time_bonus)

func reset_collectible() -> void:
	is_collected = false
	show() # Make it visible again
	$CollisionShape3D.set_deferred("disabled", false) # Turn physics back on
