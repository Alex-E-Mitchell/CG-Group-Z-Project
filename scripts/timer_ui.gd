extends CanvasLayer

@onready var timer_label: Label = $TimerLabel

var timer_running := false
var elapsed_time := 0.0

func _ready() -> void:
	visible = false
	timer_label.text = "00:00.00"


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


func stop_timer() -> void:
	timer_running = false
	visible = true


func reset_timer() -> void:
	timer_running = false
	elapsed_time = 0.0
	timer_label.text = "00:00.00"
	visible = false


func format_time(time: float) -> String:
	var minutes := int(time) / 60
	var seconds := int(time) % 60
	var milliseconds := int((time - int(time)) * 100)

	return "%02d:%02d.%02d" % [minutes, seconds, milliseconds]
