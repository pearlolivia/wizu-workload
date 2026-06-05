extends Control

const taxRate = 0.2
const pensionRate = 0.05
const SLACKER_MAX = 20
const COASTER_MAX = 45

@onready var wallet = preload("res://resources/wallet.tres")

func _ready() -> void:
	var score = wallet.total
	$Background/Results/Income/Value.text =  str("%0.2f" % score)
	var tax = "%0.2f" % (score * taxRate)
	var pension = "%0.2f" % (score * pensionRate)
	
	$Background/Results/Tax/Value.text = str(tax)
	$Background/Results/Pension/Value.text = str(pension)
	$Background/Results/Net/Value.text = '£' + str(score - float(tax) - float(pension))
	
	if (score <= SLACKER_MAX):
		$Background/Achievement/Label.text = 'Slacker'
	elif (score <= COASTER_MAX):
		$Background/Achievement/Label.text = 'Coaster'
	else:
		$Background/Achievement/Label.text = 'Hustler'

func _on_button_pressed() -> void:
	# on restart - reset stats & change scene to main game
	Global.SQUASHED_BUGS = 0
	Global.SUCCESSFUL_COMPILES = 0
	wallet.set_value(0)
	get_tree().change_scene_to_file("res://scenes/game.tscn")
