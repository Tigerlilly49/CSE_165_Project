extends Moving_Objects
class_name Walls
	
func _accelerate_object():
	SPEED = SPEED * 1.05

func _rand_pos():
	randomize()
	return randi() % 525

func _ready():
	is_background = false;
	type = "wall"
	var rand = _rand_pos()
	var pos = rand - 262.5;
	
	position = Vector2(600, pos) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if !get_parent().is_dead:
		#position = position.move_toward(Vector2(-800, position.y), delta * SPEED)
	#else:
		#queue_free()

