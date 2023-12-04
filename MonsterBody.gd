extends CharacterBody2D

var speed = 250  # Speed of the monster
var player  # Reference to the player
var spell_timer


func _ready():
	# Assuming the player node is named "Player" and is at the root of the scene
	var player_node_path = "/root/Arena1/Player"
	if has_node(player_node_path):
		player = get_node(player_node_path)
	else:
		push_error("Player node not found at path: " + player_node_path)

	var spell_timer_node_path = "SpellTimer"
	if has_node(spell_timer_node_path):
		spell_timer = get_node("SpellTimer")
		spell_timer.timeout.connect(Callable( self, "_on_spell_timer_timeout"))
		spell_timer.start()
	else:
		push_error("SpellTimer node not found at path: " + spell_timer_node_path)

func _physics_process(_delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func _on_spell_timer_timeout():
	cast_spell()


func cast_spell():
	# Logic for casting the spell
	# Determine random location for AoE
	var spell_location = Vector2(
		randf_range(0, get_viewport().size.x),
		randf_range(0, get_viewport().size.y)
	)

	# Instance your flame circle AoE spell here
	# For example, assuming you have a PackedScene for your flame spell:
	var flame_circle_scene = preload("res://flame_circle.tscn")
	var flame_circle = flame_circle_scene.instantiate()
	flame_circle.global_position = spell_location
	# Add the spell instance to the root node or a specific arena node
	var arena = get_node("/root/Arena1")  # Adjust the path as necessary
	arena.add_child(flame_circle)


