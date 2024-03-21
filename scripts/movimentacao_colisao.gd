extends CharacterBody2D

var PLAYER_VELOCITY :float = 400.0 #Velocidade de movimentaçao
var player_direction :Vector2 = Vector2(0,0) #direçao que o jogador anda

func _ready():
	pass 

func _process(delta):
	move_player()
	
func move_player() -> void:
	var horizontal_direction :float 
	var vertical_direction  :float
	
	#Verifica se o player esta se movendo para a direita ou esquerda
	horizontal_direction = move_horizontal()
	#Verifica se o player esta se movendo para cima ou para baixo	
	vertical_direction = move_vertical()
	
	# Define a direçao do player
	player_direction.x = horizontal_direction
	player_direction.y = vertical_direction
	
	#faz o player andar de acordo com a velocidade
	velocity = player_direction.normalized() * PLAYER_VELOCITY
	move_and_slide()
	
func move_horizontal() -> float:
	if Input.is_action_pressed("mv_right"):
		return 1 #vai pra direita
	elif Input.is_action_pressed("mv_left"):
		return -1 #vai pra esquerda
	else:
		return 0 #para quando solta a tecla
		
		
func move_vertical() -> float:
	if Input.is_action_pressed("mv_up"):
		return -1 #vai pra cima
	elif Input.is_action_pressed("mv_down"):
		return 1 #vai pra baixo
	else:
		return 0 #para quando solta a tecla
		
