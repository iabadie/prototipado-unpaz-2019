extends KinematicBody2D

var velocidad = Vector2()
const gravedad = 9.8
const vel_pasos = 200
const max_velocidad = 1000
const vec_normal_al_piso = Vector2(0, -1)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right") and velocidad.x < max_velocidad:
		velocidad.x += vel_pasos
	if Input.is_action_just_pressed("ui_left") and velocidad.x > -max_velocidad:
		velocidad.x -= vel_pasos
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocidad.y = - max_velocidad
	if velocidad.y < max_velocidad:
		velocidad.y += gravedad * gravedad / 2
	if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
		velocidad.x = 0
	move_and_slide(velocidad, vec_normal_al_piso)
