extends Moving_Objects
class_name Midground;

var first: bool;

func _set_speed(num: float):
	SPEED = num

func _accelerate_object():
	SPEED = SPEED * 1.02

func _ready():
	is_background = true;
	type = "mid"
	if(first):
		position = Vector2(-600, 325)
	else:
		position = Vector2(600, 325) # Replace with function body.
