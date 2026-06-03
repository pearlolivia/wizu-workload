extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.popup_centered()
	$Window.visible = false
	$Window.mouse_passthrough = true
	#$Window.get_close_button().focus_mode = Control.FOCUS_NONE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	$Window.visible = true

func _on_window_close_requested() -> void:
	print('hit')
	$Window.visible = false


#func _on_window_window_input(event: InputEvent) -> void:
	#if (event is InputEventMouseButton and event.pressed):
		#print('mouse')


#func _on_test_body_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#print(event)
