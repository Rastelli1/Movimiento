extends CharacterBody2D

export var aceleracion=200

var velocidad=Vector2()



func _physics_process(delta: float)->void:
	obtenerInput()
	velocidad=move_and_slide(velocidad)
	


func obtenerInput():
	
	if Input.is_action_pressed("moverDerecha"):
		velocidad.x +=1
	if Input.is_action_pressed("ui_left"):
		velocidad.x -=1
	if Input.is_action_pressed("ui_down"):
		velocidad.y +=1
	if Input.is_action_pressed("ui_up"):
		velocidad.y -=1
