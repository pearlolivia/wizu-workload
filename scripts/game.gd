extends Node2D

var desktop_scene

func _ready() -> void:
	desktop_scene = $Player/Desktop
	
func _on_player_start_work() -> void:
	desktop_scene.visible = true
	$Objects.visible = false
	$Player/Tutorial.visible = false

func _on_player_pause_work() -> void:
	desktop_scene.visible = false
	$Player/Desktop/Window.visible = false
	$Objects.visible = true


func _on_button_pressed() -> void:
	$Player/Tutorial.visible = false
