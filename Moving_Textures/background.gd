extends Moving_Objects
class_name Background;

var first: bool;

func _accelerate_object():
	SPEED = SPEED * 1.01

func _ready():
	is_background = true;
	type = "back"
	if(first):
		position = Vector2(-600, 325)
	else:
		position = Vector2(600, 325) # Replace with function body.
