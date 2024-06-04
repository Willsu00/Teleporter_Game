extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
	ClickSfx.play()
	Global.score = 0


func _on_play_mouse_entered():
	HoverOs.play()
