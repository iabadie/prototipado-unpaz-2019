extends KinematicBody2D

var vectorDeDireccion = Vector2();

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	move_and_slide(vectorDeDireccion)
	pass

func set_vector(vector):
	vectorDeDireccion = vector.normalized() * 400;

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
