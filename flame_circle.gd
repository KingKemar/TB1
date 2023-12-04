extends Area2D  # or whatever the root node type is

func _ready():
	var timer = get_node("Timer")  # Adjust the path if your Timer node is named or placed differently
	timer.start()
	timer.timeout.connect(Callable(self, "_on_Timer_timeout"))
	var animated_sprite = get_node("AnimatedSprite2D")
	animated_sprite.play("flame_circle")

func _on_Timer_timeout():
	queue_free()  # This will remove the spell instance from the scene
