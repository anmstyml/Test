extends CharacterBody2D

var speed = 2
var jumpForce = 200
var gravity = 350

var vel = Vector2()

@onready var imagePlayer = get_node('Playr')

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		vel.x -= speed
	elif Input.is_action_pressed("player_right"):
		vel.x += speed
	else:
		velocity.x = 0
		
	vel.y += gravity * delta
		
	if Input.is_action_just_pressed("player_jump"):
		vel.y -= jumpForce	
		
	velocity = vel * speed
	move_and_slide()
	
	if velocity.x < 0:
		imagePlayer.flip_h = true
	elif velocity.x > 0:
		imagePlayer.flip_h = false

