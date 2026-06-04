extends Area2D

@export var resource: Snack

@onready var wallet = preload("res://resources/wallet.tres")
@onready var energy = preload("res://resources/energy/energy.tres")

func _ready():
	$Sprite2D.texture = resource.texture[0]

func _on_body_entered(body: Node2D) -> void:
	if (body.name == 'Player'):
		wallet.add(resource.points)
		energy.add(resource.energy)
		queue_free()
