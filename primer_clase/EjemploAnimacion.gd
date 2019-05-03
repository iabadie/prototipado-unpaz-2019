extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pasos;

# Called when the node enters the scene tree for the first time.
func _ready():
	pasos = 10;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= pasos
	if Input.is_action_pressed("ui_right"):
		position.x += pasos
	if Input.is_action_pressed("ui_down"):
		position.y += pasos
	if Input.is_action_pressed("ui_left"):
		position.x -= pasos
	pass
