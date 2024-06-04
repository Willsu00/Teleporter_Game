extends Control

@onready var pause_menu = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Unpause"):
		if Global.game_paused == true:
			pause_menu.hide()
			get_tree().paused = false
			Global.game_paused = false
			print("game unpaused")
