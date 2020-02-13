extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://ship1.tscn")
	
	
	var timer = Timer.new()
	timer.set_wait_time(3.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "repeat_me")
	add_child(timer)
	timer.start()
	

func _physics_process(delta):
	if Input.is_action_just_released("pause"):
		get_tree().paused = true
	if Input.is_action_just_released("unpause"):
		get_tree().paused = false

func repeat_me():
	var scene = load("res://ship1.tscn")
	var zombie = scene.instance()
	zombie.player = $Player
	add_child(zombie)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
