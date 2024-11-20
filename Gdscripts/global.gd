extends Node
var debugger=""
var cat_count=1
var money_collected=0
var pos=Vector3(0,0,0)
var in_movement=false
var in_motion=false
var global_force=0
var level_finished=false
var dead=false 
var member_dict = {}
var next_level
var scale_value=1.0
var decremant=0.1

var speed_var=1

func _ready():
	randomize()
	get_node("/root/Node3D/enviroment/CanvasLayer/Label").visible=false
	get_node("/root/Node3D/enviroment/CanvasLayer/Label").scale.x=0
#	get_node("/root/Node3D/enviroment/CanvasLayer/Label2").visible=false
	if OS.get_name()=="Android":
		GlobalSave.loadValue("player","section1")
		var current_level="res://assets/tscn/levels/Level_"\
		+str(GlobalSave.display_value)+".tscn"
		if GlobalSave.display_value>10: 
			if randi()%2==0:current_level="res://assets/tscn/levels/Level_R.tscn"
			else:current_level="res://assets/tscn/levels/Level_B.tscn"
		get_tree().change_scene_to_file(current_level)
		get_node("/root/Node3D/enviroment/CanvasLayer/Label").visible=false
		

func scale_upp():
	scale_value+=0.25-decremant
	decremant+=0.02
	for i in member_dict:
		var amount = member_dict[i]
		amount.scale_up(scale_value)

func global_jump():
	for i in member_dict:
		var amount = member_dict[i]
		amount.get_node("AnimationPlayer").play("scale_2")

func reset_script():
#	await get_tree().create_timer(100).timeout
	cat_count=1
	money_collected=0
	pos=Vector3(0,0,0)
	in_movement=false
	in_motion=false
	global_force=0
	level_finished=false
	dead=false 
	member_dict = {}
	scale_value=1.0
	decremant=0.1
	speed_var=1
	

var s_guard=true
func succes_state():
	if s_guard and OS.get_name()=="Android":
		s_guard=false
		GlobalSave.loadValue("player","section1")
		GlobalSave.display_value+=1
		
		GlobalSave.saveValue("player","section1")
		GlobalSave.loadValue("player","section1")
		var next_level="res://assets/tscn/levels/Level_"+str(GlobalSave.display_value)+".tscn"
		randomize()
		if GlobalSave.display_value>10: 
			if randi()%2==0:next_level="res://assets/tscn/levels/Level_R.tscn"
			else:next_level="res://assets/tscn/levels/Level_B.tscn"
		Global.reset_script()
		get_tree().change_scene_to_file(next_level)
		get_node("/root/Node3D/enviroment/CanvasLayer/Label").visible=false
		get_node("/root/Node3D/enviroment/CanvasLayer/Label").scale.x=0
var f_guard=true
func fail_state():
	if f_guard:
		f_guard=false
		Global.reset_script()
		get_tree().reload_current_scene()

#func _process(delta):
#	if member_dict.is_empty():
#		dead=true
#		print('fgh')
