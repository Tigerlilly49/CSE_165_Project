extends Node2D
class_name Moving_Objects

var SPEED: float;
var is_background: bool;
var type: String;

func _ready():
	pass # Replace with function body.
	

func _set_speed(num: float):
	SPEED = num

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_parent().is_dead:
		position = position.move_toward(Vector2(-3000, position.y), delta * SPEED)
	else:
		remove()

func remove():
	queue_free()
