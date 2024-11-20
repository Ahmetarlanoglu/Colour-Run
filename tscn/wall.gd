extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	

#                                        . 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_just_pressed("ui_up"):
#
#		for i in self.get_children():
#			i.gravity_scale=1
#			i.apply_central_impulse(Vector3(randf_range(-6,6),-6,randf_range(5,10)))
#		await get_tree().create_timer(1.0).timeout
#		for i in self.get_children():
#			i.sleeping=false
#			i.apply_central_impulse(Vector3(0,0.5,0))
#		await get_tree().create_timer(1.0).timeout
#		for i in self.get_children():
#			i.sleeping=false
#			i.apply_central_impulse(Vector3(0,0.2,0))
#		queue_free()

func _on_area_3d_area_entered(area):
	if area.is_in_group("player"):
		Global.level_finished=true
		await get_tree().create_timer(1.5).timeout
		if Global.member_dict.size()!=0:
			for i in self.get_children():
				i.apply_central_impulse(Vector3(randf_range(-0.2,0.2),0.0,randf_range(-0.2,0.2)))
				i.gravity_scale=0.6
			await get_tree().create_timer(0.4).timeout
			for i in self.get_children():
				i.set_collision_mask_value(2,false)
			await get_tree().create_timer(1.2).timeout
			for i in self.get_children():
				i.queue_free()
		else:
			for i in self.get_children():
				i.freeze=true
