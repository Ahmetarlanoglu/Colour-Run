extends Node3D
var fark=Vector2(0,0)
var in_click_acceleration=1
var addition=Vector2(0,0)
var addition_guard=false
@export var camera_limit_range=0.6
# Called when the node enters the scene tree for the first time
var guard=true


func _ready():
	get_node("/root/Node3D/enviroment/CanvasLayer/Label").visible=false
	get_node("/root/Node3D/enviroment/CanvasLayer/Label").scale.x=0
	print(global_position)
	$cat_pack.in_follow()
	await get_tree().create_timer(1).timeout
	$cat_pack.cat_id=randf()
	Global.member_dict[$cat_pack.cat_id] = $cat_pack
	Global.s_guard=true
	Global.f_guard=true

func _process(delta):
#	$Cameram.global_position.x=$player.global_position.x
	$Cameram.global_position.z=$player.global_position.z-7.5
	var p_pos=Vector2($player.global_position_passer,0)
	var player_position=Vector2($player.global_position.x,0)
	Global.in_motion=$player.in_motion
	if $player.in_motion:
#		player_position=player_position.lerp(p_pos,delta*0.001)
		fark = (p_pos-player_position)
		var force=fark.x*30*delta
		Global.global_force=force
		$player.global_position.x+=force
		get_parent().speed=fark
	
	var hedef_pos = Vector2(p_pos.x,0)
	var camera_passer=Vector2($Cameram.global_position.x,0)
	camera_passer = camera_passer.lerp(hedef_pos, delta * 2.5)
	if camera_passer.x>camera_limit_range-0.6  and camera_passer.x<camera_limit_range+0.85 :
		
		$Cameram.global_position.x=camera_passer.x
	if Global.level_finished :
		$Cameram.global_position.x=0.7
		if guard:
			guard=false
			$AnimationPlayer.play("fov")
			$player.set_process_input(false)
		if not Global.dead :
			$player.speed=1.5
		else:
			$player.speed=0
	
