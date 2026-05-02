extends CanvasLayer

@onready var timer_label: Label = $TimerLabel

var timer_running := false
var elapsed_time := 0.0

var normal_color: Color
var flash_tween: Tween

func _ready() -> void:
	visible = false
	timer_label.text = "00:00.00"
	normal_color = timer_label.modulate


func _process(delta: float) -> void:
	if not timer_running:
		return

	elapsed_time += delta
	timer_label.text = format_time(elapsed_time)


func start_timer() -> void:
	visible = true
	timer_running = true
	elapsed_time = 0.0
	timer_label.text = "00:00.00"
	timer_label.modulate = normal_color


func stop_timer() -> void:
	timer_running = false
	visible = true
	timer_label.modulate = Color.YELLOW


func reset_timer() -> void:
	timer_running = false
	elapsed_time = 0.0
	timer_label.text = "00:00.00"
	timer_label.modulate = normal_color
	visible = false


func format_time(time: float) -> String:
	var minutes := int(time) / 60
	var seconds := int(time) % 60
	var milliseconds := int((time - int(time)) * 100)

	return "%02d:%02d.%02d" % [minutes, seconds, milliseconds]


func reduce_time(amount: float) -> void:
	elapsed_time = max(elapsed_time - amount, 0.0)
	timer_label.text = format_time(elapsed_time)
	flash_timer_color(Color.GREEN)


func add_time(amount: float) -> void:
	elapsed_time += amount
	timer_label.text = format_time(elapsed_time)
	flash_timer_color(Color.RED)


func flash_timer_color(flash_color: Color) -> void:
	if flash_tween:
		flash_tween.kill()

	timer_label.modulate = flash_color

	flash_tween = create_tween()
	flash_tween.tween_property(timer_label, "modulate", normal_color, 1.0)
