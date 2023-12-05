extends Moving_Objects
class_name Foreground;

var first: bool;

func _accelerate_object():
	SPEED = SPEED * 1.03

func _ready():
	is_background = true;
	type = "fore"
	if(first):
		position = Vector2(-600, 325)
	else:
		position = Vector2(600, 325) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
