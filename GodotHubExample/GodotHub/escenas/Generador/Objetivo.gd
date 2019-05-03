extends Sprite

func _ready():
	pass # Replace with function body.

func _process(delta):
	rotation_degrees -= 5
	position.x -= 12
	pass


func _on_Area2D_area_entered(area):
	queue_free()
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
