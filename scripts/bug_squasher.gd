extends Node2D

var rng := RandomNumberGenerator.new()
var offset = 170

@onready var bug_scene = preload("res://scenes/bug.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_bug()

func spawn_bug():
	var spawnerPosition = $Spawner.position
	var random_x = rng.randi_range(spawnerPosition.x - offset, spawnerPosition.x + offset)
	var random_y = rng.randi_range(spawnerPosition.y - offset, spawnerPosition.y + offset)
	var bug = bug_scene.instantiate()
	add_child(bug)
	bug.position = Vector2(random_x, random_y)
	bug.add_to_group("bugs")
	
func _on_timer_timeout() -> void:
	var new_timeout = rng.randi_range(3, 6)
	$Timer.wait_time = new_timeout
	spawn_bug()
