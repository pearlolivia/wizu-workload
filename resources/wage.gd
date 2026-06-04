extends Resource

class_name Wage

@export var total := 0

signal update()

func add(points: int):
	total = total + points
	update.emit()
	
func delete(points: int):
	if (total - points < 0):
		total = 0
	else:
		total = total - points
	update.emit()

func set_value(points: int):
	total = points
