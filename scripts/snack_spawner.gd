extends Node2D

var rng := RandomNumberGenerator.new()
var spawn_points

@onready var snack_scene = preload("res://scenes/snack.tscn")

var snacks: Array[Snack]
var _snack_dir := DirAccess.open("res://resources/snacks/")

#func _init() -> void:
	## get all snack items
	#for _file: String in _snack_dir.get_files():
		#if (_file.get_extension() == "tres"):
			#var _item := ResourceLoader.load(_snack_dir.get_current_dir() + "/" + _file)
			#snacks.push_back(_item)

func _ready() -> void:
	spawn_points = $Markers.get_children()
	$Timer.start(12)
	# get all snack items
	for _file: String in _snack_dir.get_files():
		if (_file.get_extension() == "tres" or _file.get_extension() == "remap"):
			var _item := ResourceLoader.load(_snack_dir.get_current_dir() + "/" + _file.replace('.remap', ''))
			snacks.push_back(_item)

func spawn_snack():
	var marker_idx = rng.randi_range(0, spawn_points.size() - 1)
	var spawnPosition = spawn_points[marker_idx].position
	var snack = snack_scene.instantiate()
	
	# randomise snack & add to spawner node
	print('snacks: ', snacks)
	print('snacks: ', snacks.size())
	var snack_idx = rng.randi_range(0, snacks.size() - 1)
	snack.resource = snacks[snack_idx]
	add_child(snack)
	snack.position = Vector2(spawnPosition.x, spawnPosition.y)
	snack.add_to_group("snacks")
	
func _on_timer_timeout() -> void:
	spawn_snack()
