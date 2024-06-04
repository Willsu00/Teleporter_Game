extends Control

@onready var final_score = $"Final Score"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	final_score.text = "Final Score: %d" % Global.score


func _on_to_menu_pressed():
	Global.score = 0
	get_tree().change_scene_to_file("res://Main.tscn")
	ClickSfx.play()


func _on_to_menu_mouse_entered():
	HoverOs.play()
