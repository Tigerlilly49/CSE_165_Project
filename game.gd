extends Node2D

@onready var mov = preload("res://Moving_Textures/walls.tscn")
@onready var clo = preload("res://Moving_Textures/clouds.tscn")
@onready var fore = preload("res://Moving_Textures/foreground.tscn")
@onready var mid = preload("res://Moving_Textures/midground.tscn")
@onready var back = preload("res://Moving_Textures/background.tscn")

var points = 0
var highscore = 0
var is_dead;
var make_New = 3
var start_speed_walls = 300
var start_speed_clouds = 100
var start_speed_fore = 300
var start_speed_mid = 225
var start_speed_back = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	is_dead = false;
	$SpeedUp.start()
	make_foreground(true)
	make_midground(true)
	make_background(true)
	make_wall()
	make_cloud()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_speed():
	start_speed_walls *= 1.05
	start_speed_clouds *= 1.01
	start_speed_fore *= 1.04
	start_speed_mid *= 1.03
	start_speed_back *= 1.02
	make_New -= 0.1
	
	
	for object in self.get_children():
		if(object.has_method("_accelerate_object")):
			object._accelerate_object()

func make_background(st:bool):
	var object = back.instantiate()
	object._set_speed(start_speed_back)
	object.first = st
	object._set_speed(start_speed_back)
	add_child(object)

func make_midground(st:bool):
	var object = mid.instantiate()
	object._set_speed(start_speed_mid)
	object.first = st
	object._set_speed(start_speed_mid)
	add_child(object)

func make_foreground(st: bool):
	var object = fore.instantiate()
	object._set_speed(start_speed_fore)
	object.first = st
	object._set_speed(start_speed_fore)
	add_child(object)

func make_cloud():
	var object = clo.instantiate()
	object._set_speed(start_speed_clouds)
	add_child(object)

func make_wall():
	$MakeNew.start(make_New);
	var object = mov.instantiate()
	object._set_speed(start_speed_walls)
	add_child(object)
	
func _on_timer_timeout():
	make_wall()
	make_cloud() 

func _on_crash_detector_area_entered(area):
	if(area == $Deadzone):
		_on_death()
	else:
		if(!area.get_parent().is_background):
			_on_death()
		
func _on_death():
	$level1.visible = false
	is_dead = true
	$MakeNew.stop()
	
	points = 0
	make_New = 3
	start_speed_walls = 300
	start_speed_clouds = 100
	start_speed_fore = 300
	start_speed_mid = 225
	start_speed_back = 150

func _on_restart_pressed(): #remove deathscreen, reset bird position
	$level1.visible = true
	$FlappyBird.position = Vector2(-400,0)
	$deathscreen/Restart.release_focus()
	is_dead = false
	make_wall()
	make_foreground(true)
	make_midground(true)
	make_background(true)
	var text = "Points: " + str(points) + "\nHighscore: " + str(highscore)
	$Points.set_text(text)
	
	# Replace with function body.

func _on_deadzone_area_exited(area):
	if(area != $FlappyBird/crash_detector):
		area.get_parent().remove()
	#pass # Replace with function body.


func _on_speed_up_timeout():
	increase_speed()
	$SpeedUp.start()


func _on_deadzone_area_entered(area):
	if(area != $FlappyBird/crash_detector):
		if(area.get_parent().type == "fore"):
			make_foreground(false)
		if(area.get_parent().type == "mid"):
			make_midground(false)
		if(area.get_parent().type == "back"):
			make_background(false)


func _on_point_track_area_entered(area):
	if(area.get_parent().type == "wall"):
		points += 0.5
		if(points > highscore):
			highscore = points;
		var text = "Points: " + str(points) + "\nHighscore: " + str(highscore)
		$Points.set_text(text)
