extends Control

var energy_left
var energy = preload("res://resources/energy/energy.tres")

func _ready() -> void:
	# connect update signal with timer (UI) update function
	energy.update.connect(update_energy)
	energy_left = energy.value

func _process(delta: float) -> void:
	energy_left = $Timer.time_left
	$ProgressBar.value = energy_left
	energy.set_value(energy_left)

func update_energy():
	# realign Timer with new energy value
	$Timer.start(energy.value)
	
