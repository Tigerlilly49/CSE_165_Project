extends Moving_Objects
class_name Clouds;

func _accelerate_object():
	SPEED = SPEED * 1.01

func _rand_pos():
	randomize()
	return randi() % 325

func _ready():
	is_background = true;
	type = "cloud"
	var rand = _rand_pos()
	var pos = -1 * rand;
	
	position = Vector2(600, pos) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
