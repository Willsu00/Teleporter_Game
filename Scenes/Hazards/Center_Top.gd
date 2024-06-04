extends Node2D

@onready var death_timer = $DeathTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	death_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.score >= 2000 and Global.score < 5000:
		position.y += 2
	elif Global.score >= 5000:
		position.y += 3
	else:
		position.y += 1


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
		Deathsound.play()
		get_tree().change_scene_to_file("res://Scenes/EndScreen.tscn")


func _on_death_timer_timeout():
	queue_free()
