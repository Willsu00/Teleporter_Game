extends Node2D

@onready var collision_shape_2d_5 = $Background/CollisionShape2D5
@onready var collision_shape_2d_6 = $Background/CollisionShape2D6
@onready var collision_shape_2d_7 = $Background/CollisionShape2D7
@onready var collision_shape_2d_8 = $Background/CollisionShape2D8
@onready var collision_shape_2d_9 = $Background/CollisionShape2D9
@onready var collision_off = $CollisionOff

@onready var spawn_timer_top = $SpawnTimerTop
@onready var spawn_loc_u = $SpawnLocU

@onready var spawn_timer_bot = $SpawnTimerBot
@onready var spawn_loc_b = $SpawnLocB

@onready var spawn_timer_t_center = $SpawnTimerTCenter
@onready var spawn_loc_ct = $SpawnLocCt

@onready var spawn_timer_lt = $SpawnTimerLT
@onready var spawn_loc_lt = $SpawnLocLt

@onready var spawn_timer_lb = $SpawnTimerLB
@onready var spawn_loc_lb = $SpawnLocLb

@onready var spawn_timer_s_center = $SpawnTimerSCenter
@onready var spawn_loc_cs = $SpawnLocCs


@onready var pause_menu = $Pause_menu


var top_hazard = preload("res://Scenes/Hazards/Top_Laser.tscn")
var bot_hazard = preload("res://Scenes/Hazards/Bottom_Laser.tscn")
var TC_hazard = preload("res://Scenes/Hazards/Center_Top.tscn")
var lt_hazard = preload("res://Scenes/Hazards/LeftT.tscn")
var lb_hazard = preload("res://Scenes/Hazards/LeftB.tscn")
var SC_hazard = preload("res://Scenes/Hazards/Center_Side.tscn")

var minTime = 4
var maxTime = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	#startRandTimer()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Down"):
		collision_off.start()
		collision_shape_2d_5.disabled = true
		collision_shape_2d_6.disabled = true
		collision_shape_2d_7.disabled = true
		collision_shape_2d_8.disabled = true
		collision_shape_2d_9.disabled = true
	
	if collision_off.time_left == 0:
		collision_shape_2d_5.disabled = false
		collision_shape_2d_6.disabled = false
		collision_shape_2d_7.disabled = false
		collision_shape_2d_8.disabled = false
		collision_shape_2d_9.disabled = false
	
	
	if Input.is_action_just_pressed("Pause"):
		pause_menu.show()
		get_tree().paused = true
		Global.game_paused = true
		print("game paused")


func _on_spawn_timer_top_timeout():
	var top_hazard_spawn = top_hazard.instantiate()
	top_hazard_spawn.position = spawn_loc_u.position
	add_child(top_hazard_spawn)
	TstartRandTimer()
	


func _on_spawn_timer_bot_timeout():
	var bot_hazard_spawn = bot_hazard.instantiate()
	bot_hazard_spawn.position = spawn_loc_b.position
	add_child(bot_hazard_spawn)
	BstartRandTimer()

func _on_spawn_timer_t_center_timeout():
	var TC_hazard_spawn = TC_hazard.instantiate()
	TC_hazard_spawn.position = spawn_loc_ct.position
	add_child(TC_hazard_spawn)
	TCstartRandTimer()
	
func _on_spawn_timer_lb_timeout():
	if Global.score >= 5000:
		var lb_hazard_spawn = lb_hazard.instantiate()
		lb_hazard_spawn.position = spawn_loc_lb.position
		add_child(lb_hazard_spawn)
		lbstartRandTimer()


func _on_spawn_timer_lt_timeout():
	if Global.score >= 5000:
		var lt_hazard_spawn = lt_hazard.instantiate()
		lt_hazard_spawn.position = spawn_loc_lt.position
		add_child(lt_hazard_spawn)
		ltstartRandTimer()


func _on_spawn_timer_s_center_timeout():
	if Global.score >= 8000:
		var cs_hazard_spawn = SC_hazard.instantiate()
		cs_hazard_spawn.position = spawn_loc_cs.position
		add_child(cs_hazard_spawn)
		SCstartRandTimer()
	
	
func TstartRandTimer():
	var TrandomTime = randi_range(minTime, maxTime)
	spawn_timer_top.wait_time = TrandomTime
	spawn_timer_top.start()
	
func BstartRandTimer():
	var BrandomTime = randi_range(minTime, maxTime)
	spawn_timer_bot.wait_time = BrandomTime
	spawn_timer_bot.start()

func TCstartRandTimer():
	var TCrandomTime = randi_range(5, 8)
	spawn_timer_t_center.wait_time = TCrandomTime
	spawn_timer_t_center.start()

func ltstartRandTimer():
	var ltrandomTime = randi_range(5, 8)
	spawn_timer_lt.wait_time = ltrandomTime
	spawn_timer_lt.start()

func lbstartRandTimer():
	var lbrandomTime = randi_range(5, 8)
	spawn_timer_lb.wait_time = lbrandomTime
	spawn_timer_lb.start()

func SCstartRandTimer():
	var scrandomTime = randi_range(5, 8)
	spawn_timer_s_center.wait_time = scrandomTime
	spawn_timer_s_center.start()




