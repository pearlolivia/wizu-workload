extends CharacterBody2D

const SPEED = 70
var input_dir: Vector2
var lastDirection = 'down'
var character = 'manu'
var is_sitting := false

var chair

func _ready() -> void:
	chair = get_parent().find_child('Chair')
	chair.player_sit.connect(sit_animation)
	chair.player_get_up.connect(stand_animation)
	
func _physics_process(_delta):
	# keyboard input
	input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir.normalized() * SPEED
	
	if (is_sitting == true):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play('sit')
		return
	
	# moves node and detects collision objects
	move_and_slide()
	
	# animation
	if (Input.is_action_pressed("down")):
		$AnimatedSprite2D.play("walk_down")
		lastDirection = 'down'
	elif (Input.is_action_pressed("up")):
		$AnimatedSprite2D.play("walk_up")
		lastDirection = 'up'
	elif (Input.is_action_pressed("left")):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_right")
		lastDirection = 'left'
	elif (Input.is_action_pressed("right")):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_right")
		lastDirection = 'right'
	else:
		if (lastDirection == 'up'):
			$AnimatedSprite2D.play("idle_up")
		elif (lastDirection == 'down'):
			$AnimatedSprite2D.play("idle_down")
		elif (lastDirection == 'left'):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("idle_right")
		elif (lastDirection == 'right'):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("idle_right")

func sit_animation():
	is_sitting = true
	self.position = chair.position

func stand_animation():
	is_sitting = false
	self.position.x = chair.position.x + 10
	self.position.y = chair.position.y - 10
