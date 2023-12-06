extends Area2D

var damage_dealt = 75
var hit_time = 2.5  # Time in seconds when the spell hits
var elapsed_time = 0.0  # To track the elapsed time
var damage_already_dealt = false


func _ready():
	var timer = get_node("Timer")  # Adjust the path if your Timer node is named or placed differently
	timer.start()
	timer.timeout.connect(Callable(self, "_on_Timer_timeout"))
	var animated_sprite = get_node("AnimatedSprite2D")
	animated_sprite.play("flame_circle")
	damage_already_dealt = false

func _process(delta):
	
	elapsed_time += delta
	if elapsed_time >= hit_time and not damage_already_dealt:
		print(elapsed_time)
		_apply_damage()
		damage_already_dealt = true


func _on_Timer_timeout():
	queue_free()  # This will remove the spell instance from the scene

func _apply_damage():
	for body in get_overlapping_bodies():
		if body.is_in_group("characters"):  # Ensure this matches your characters' group
			body.damage_received(damage_dealt)
