extends Node3D

var animation_finished=false


var guard=true
func _ready():
	
	var duplicated_material=$metarig004/Skeleton3D/Cat.get_surface_override_material(3).duplicate()
	$metarig004/Skeleton3D/Cat.set_surface_override_material(3,duplicated_material)
	$metarig004/Skeleton3D/Cat.get_surface_override_material(3).set_albedo(Color(1,0.53,0,1))  
func _on_animation_player_animation_finished(anim_name):
	
	if anim_name=="StandUp":
		$AnimationPlayer.play("WalkCycle")
		$AnimationPlayer.speed_scale=1
		$AnimationPlayer.get_animation("WalkCycle").set_loop_mode(true)
		animation_finished=true


func _process(_delta):
	await get_tree().create_timer(1).timeout
	Global.in_movement=true
