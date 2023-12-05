extends CharacterBody2D

# speed of the character
var speed = 500
var character_base = CharacterBase.new(100,100,0)

func _physics_process(_delta):
	# Local variable for movement direction
	var move_dir = Vector2()

	# Check for input and adjust the move direction
	if Input.is_action_pressed('ui_right'):
		move_dir.x += 1
	if Input.is_action_pressed('ui_left'):
		move_dir.x -= 1
	if Input.is_action_pressed('ui_down'):
		move_dir.y += 1
	if Input.is_action_pressed('ui_up'):
		move_dir.y -= 1

	# Normalize the move direction and apply speed
	move_dir = move_dir.normalized() * speed

	# Update the velocity based on move direction
	velocity = move_dir

	# Move the character using move_and_slide
	move_and_slide()

func damage_received(damage_dealt):
	character_base.damage_received(damage_dealt)
