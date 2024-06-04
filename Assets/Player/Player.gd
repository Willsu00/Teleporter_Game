extends CharacterBody2D


@export var speed = 300
@export var jump_force = 650
@export var gravity = 1200


@onready var progress_bar = $ProgressBar
@onready var tp_timer = $Tp_timer
@onready var animated_sprite_2d = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.max_value = tp_timer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_axis("Left","Right")
	var mouse_pos = get_viewport().get_mouse_position()
	
	if direction:
		velocity.x = direction * speed
		if is_on_floor():
			animated_sprite_2d.play("Run")
	else:
		velocity.x = 0
		if is_on_floor():
			animated_sprite_2d.play("Idle")
	
	
	if Input.is_action_pressed("Left"):
		animated_sprite_2d.flip_h = true
	elif Input.is_action_pressed("Right"):
		animated_sprite_2d.flip_h = false
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 0:
			animated_sprite_2d.play("Fall")
		
	
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y -= jump_force
		animated_sprite_2d.play("Jump")
		HoverOs.play()
	
	
	if Input.is_action_just_released("LMB") and Global.can_click:
		TpSfx.play()
		position = mouse_pos
		Global.can_click = false
		tp_timer.start()
	
	progress_bar.value = tp_timer.time_left
	
	if tp_timer.time_left == 0:
		progress_bar.hide()
	else:
		progress_bar.show()
	
	move_and_slide()



func _on_tp_timer_timeout():
	Global.can_click = true
