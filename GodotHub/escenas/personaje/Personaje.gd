extends Sprite

var bala = preload("res://escenas/bala/Bala.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("click"):
		var bala1 = bala.instance()
		bala1.set_vector(get_global_mouse_position() - get_global_transform().get_origin())
		add_child(bala1)
	pass
