extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.popup_centered()
	$Window.visible = false
	$Window.mouse_passthrough = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	$Window.visible = true

func _on_window_close_requested() -> void:
	print('hit')
	$Window.visible = false
