extends Control

var BUGS_LABEL
var RUN_LABEL

var outstanding_bugs := 0
var compile_time_left

@onready var task = preload("res://resources/tasks/run_code.tres")
@onready var wallet = preload("res://resources/wallet.tres")

func _ready() -> void:
	BUGS_LABEL = $VBoxContainer/Bugs/Container/Label
	RUN_LABEL = $VBoxContainer/Compiles/Container/Label
	
func _process(delta: float) -> void:
	outstanding_bugs = get_tree().get_nodes_in_group('bugs').size()
	BUGS_LABEL.text = str(Global.SQUASHED_BUGS)
	RUN_LABEL.text = str(Global.SUCCESSFUL_COMPILES)

	if ($Timer.is_stopped() == false and outstanding_bugs > 0):
		$Fail.visible = true
		await get_tree().create_timer(1).timeout
		$Fail.visible = false

	if (outstanding_bugs > 0):
		$Timer.stop()
		$ProgressBar.value = 0
	else:
		compile_time_left = $Timer.time_left
		$ProgressBar.value = compile_time_left

func _on_run_button_pressed() -> void:
	if ($Timer.is_stopped()):
		if (outstanding_bugs == 0):
			$Timer.start(3.5)
		else:
			$Error.visible = true
			await get_tree().create_timer(1).timeout
			$Error.visible = false

func _on_timer_timeout() -> void:
	$Success.visible = true
	Global.SUCCESSFUL_COMPILES += 1
	wallet.add(task.price)
	#player_energy.delete(task.energy)
	await get_tree().create_timer(1.5).timeout
	$Success.visible = false
