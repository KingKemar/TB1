extends CharacterBody2D


var hp_bar

var speed = 500 # speed of the character
var character_base = CharacterBase.new(100,100,0)

var HP_bar_path = "HP_bar"



func _ready():
	hp_bar = get_node(HP_bar_path)
	hp_bar.value = 100

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

func _process(delta):
	# Convert the global position of the character to screen coordinates
	# Position the HP bar above the character with an offset
	hp_bar.position = self.position + Vector2(-100, -200) 

func damage_received(damage_dealt):
	character_base.damage_received(damage_dealt)
	hp_bar.value = character_base.hp
