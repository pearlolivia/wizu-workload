extends Area2D

@onready var task = preload("res://resources/tasks/squash_bug.tres")
@onready var wallet = preload("res://resources/wallet.tres")
@onready var player_energy = preload("res://resources/energy/energy.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#print(wallet.total)

func _on_animation_finished() -> void:
	# delete self from scene
	self.remove_from_group('bugs')
	queue_free()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed):
		Global.SQUASHED_BUGS += 1
		$AnimatedSprite2D.play("die")
		wallet.add(task.price)
		player_energy.delete(task.energy)
