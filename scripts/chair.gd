extends RigidBody2D

var can_sit := false
var player_sitting := false

var player

signal player_sit()
signal player_get_up()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().find_child('Player')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_sitting = player.is_sitting
	if (Input.is_action_just_pressed("sit") and can_sit == true and player_sitting == false):
		player_sit.emit()
	elif (Input.is_action_just_pressed("sit") and player_sitting == true):
		player_get_up.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == 'Player'):
		can_sit = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.name == 'Player'):
		can_sit = false
