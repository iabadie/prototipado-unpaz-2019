extends KinematicBody2D

var vel = Vector2(0,0);
signal destruido;

func _physics_process(delta):
	if Input.is_action_pressed("ui_down") and vel.y < 300:
		vel.y += 20;
	if Input.is_action_pressed("ui_up") and vel.y > -300:
		vel.y -= 20;
	if Input.is_action_pressed("ui_right") and vel.x < 300:
		vel.x += 20;
	if Input.is_action_pressed("ui_left") and vel.x > -300:
		vel.x -= 20;
	move_and_slide(vel)

func _on_Area2D_area_entered(area):
	emit_signal("destruido")
	$pepe.modulate = Color(0.5,0.5,0.5,1);
	pass
