extends Resource

class_name Energy

@export var value: int = 20
@export var max_value: int = 100

signal update()

func add(points: int):
	if (value + points > max_value):
		value = max_value
	else:
		value = value + points
	update.emit()
	
func delete(points: int):
	if (value - points < 0):
		value = 0
	else:
		value = value - points
	update.emit()
	
func set_value(points: int):
	value = points
