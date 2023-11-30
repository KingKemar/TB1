extends CharacterBody2D

var speed = 250  # Speed of the monster
var player  # Reference to the player

func _ready():
	# Assuming the player node is named "Player" and is at the root of the scene
	player = get_node("/root/Arena1/Player")

func _physics_process(_delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
