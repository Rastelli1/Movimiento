extends CharacterBody2D

var speed :=140

var direccion := 0.0

var salto :=250

const gravedad:=12

var MaximoDeSaltos=2

var SaltosHechosHastaAhora=0

var suelo=false

var EstaContraUnaPared=false

var tiempo=0

@onready var animacionDelPersonaje=$Sprite2D
@onready var spritepersonaje=$Sprite2D
	
func _physics_process(delta):
	
	Movimiento()
	SaltoDoble()
	Paredes()
	spritepersonaje.flip_h=direccion<0
	move_and_slide()
	if tiempo>0:
		tiempo-=1

func SaltoDoble():
	
	if is_on_floor():
		SaltosHechosHastaAhora=0
		suelo=true
		
	if Input.is_action_just_pressed("ui_accept")  and SaltosHechosHastaAhora < MaximoDeSaltos:
		velocity.y-=salto
		suelo=false
		SaltosHechosHastaAhora +=1
		
	if not is_on_floor() :
			animacionDelPersonaje.play("saltando")
			
func Movimiento():
	
	direccion= Input.get_axis("ui_left", "ui_right")
	velocity.x=direccion*speed
	velocity.y +=gravedad
	
	if direccion != 0:
		animacionDelPersonaje.play("caminando") 
	else:
		animacionDelPersonaje.play("parado") 
	
			
func Paredes():
	if is_on_wall() and direccion != 0 and tiempo ==0:
		SaltosHechosHastaAhora=1
		tiempo=30
		EstaContraUnaPared=true
		
		if not is_on_floor() :
			suelo=false
	
	
	if is_on_floor():
		velocity.y +=gravedad
		suelo=true
