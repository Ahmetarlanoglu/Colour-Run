extends Node3D
var speed

@export var background_color:Color
@export var light_color:Color


@export var map_start_position=Vector3(1.16,-1.34,-21.44)
@export var total_lenght=8

func _ready():
	randomize()
	if randi()%4!=1 or true:
		$gates/power_up.queue_free()
	for i in 40:
		var randim=randi()%6
		if randim<2:
			add_random_seperate_barier(map_start_position,random_color())
			map_start_position.z+=6
			print("single_barier")
		if randim==2:
			add_random_gate_barier(map_start_position,random_color())
			map_start_position.z+=9
			print("gate_barier")
		if randim==3 or randim==4:
			add_random_collectable(map_start_position)
			map_start_position.z+=4
			print("collectable")
		if randim==5:
			add_random_cat_pack(map_start_position)
			map_start_position.z+=5
			print("cat_pack")
		if map_start_position.z>54:
			break
#	add_random_seperate_barier(Vector3(1.16,-1.34,-21.44),random_color())
#	add_random_gate_barier(Vector3(1.16,-1.34,-15.44),random_color())
#
#	add_random_collectable(Vector3(1.16,0.94,-18.44))
#	add_random_cat_pack(Vector3(1.16,-1.34,-15.44))
	
	$enviroment/backgorund_bottom.modulate=background_color
	var scaler=DisplayServer.window_get_size(0).y/960
	$enviroment/CanvasLayer/smoke.scale.y*=scaler
	$enviroment/CanvasLayer/smoke.position.y+=(scaler-1)*250
	var smoke_color=background_color-Color(0.1,0.1,0.1,0)
	$enviroment/CanvasLayer/smoke.texture.gradient.set_color(0,smoke_color)
#	$enviroment/CanvasLayer/smoke.texture.gradient.set_color(0,background_color)
	RenderingServer.set_default_clear_color(light_color)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$enviroment/CanvasLayer/Label.text=str(Global.debugger)
	if Input.is_action_just_pressed("ui_up"):
		print($main/cat_pack.global_position)
#	Global.debugger=$main/cat_pack.global_position
#	$finish/salmon_fish/Sketchfab_model/e5af0b77e1ee488c94a9e0740d42756dfbx/RootNode/Cube018/Cube018_Material010_0.rotate_y(delta)

func _on_area_3d_area_entered(_area):
	pass # Replace with function body.

func _on_area_3d_body_entered(body):
	body.global_position.x+=1
	body.global_position.y+=1
var barier_1=preload("res://assets/tscn/barier_Scenes/silindir_barier.tscn")#turn
var barier_2=preload("res://assets/tscn/barier_Scenes/axe_barier.tscn")
var barier_3=preload("res://assets/tscn/barier_Scenes/saw_barier.tscn")#turn
var barier_4=preload("res://assets/tscn/barier_Scenes/saw_barier_2.tscn")#turn
var barier_5=preload("res://assets/tscn/barier_Scenes/saw_barier_3.tscn")#turn
var barier_6=preload("res://assets/tscn/barier_Scenes/cube_barier_4.tscn")
var barier_7=preload("res://assets/tscn/barier_Scenes/screw_barier.tscn")#turn
var gold_1=preload("res://assets/tscn/coin_cat_2.tscn")
func add_random_seperate_barier(bar_pos,colour):
	randomize()
	var randim=randi()
	if randi()%3==0:
		var new_enemy = gold_1.instantiate()
		$collectables.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.z+=1.75
		new_enemy.global_position.x+=1.75*((randi()%3)-1)
		new_enemy.global_position.y=0.680
		new_enemy.scale*=1.5
	if randi()%4==0:
		var new_enemy = gold_1.instantiate()
		$collectables.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.z-=1.75
		new_enemy.global_position.x+=randf_range(-1.75,1.75)
		new_enemy.global_position.y=0.780
		new_enemy.scale*=1.5
		
	if randim%9==0 :
		var new_enemy = barier_1.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x-=0.25
		new_enemy.set_color(colour)
		
	if randim%9==1 or randim%9==3  :
		var new_enemy = barier_2.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.y+=1.9
		new_enemy.global_position.x-=0.25
		new_enemy.get_node("top").global_position=bar_pos
		new_enemy.get_node("top").global_position.y+=1.9
		new_enemy.get_node("top").global_position.x-=0.25
	if randim%9==2 :
		var new_enemy = barier_3.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x-=0.25
		new_enemy.global_position.y+=0.1
		new_enemy.set_color(colour)
	if randim%9==4:
		var new_enemy = barier_5.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x-=1.7
		new_enemy.global_position.y+=0.4
		new_enemy.set_color(colour)
	if randim%9==5:
		var new_enemy = barier_6.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x+=1.0
		new_enemy.diameter=3
		new_enemy.randi=3
		new_enemy.set_color(colour)
	if randim%9==6:
		var new_enemy = barier_7.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x-=0.28
	if randim%9==7 :
		var new_enemy = barier_6.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x+=1.3
		new_enemy.global_position.y+=0.7
		new_enemy.diameter=3
		new_enemy.randi=3
		new_enemy.turn=true
		new_enemy.set_color(colour)
	if randim%9==8 :
		var new_enemy = barier_6.instantiate()
		$bariers.add_child(new_enemy)
		new_enemy.global_position=bar_pos
		new_enemy.global_position.x+=1.2
		new_enemy.diameter=3
		new_enemy.randi=3
		new_enemy.turn_y=true
		new_enemy.set_color(colour)
	print(randim%9)
var gate=preload("res://export/gate.tscn")
func add_random_gate_barier(gate_pos,colour):
	var randi=randi()
	if randi%2:
		var new_gate_0 = gate.instantiate()
		$gates.add_child(new_gate_0)
		new_gate_0.global_position=gate_pos
		new_gate_0.global_position.x+=1.3
		new_gate_0.global_position.y+=0.6
		new_gate_0.color_update(colour)
		var new_gate_1 = gate.instantiate()
		$gates.add_child(new_gate_1)
		var color_2=random_color()
		while color_2==colour:
			color_2=random_color()
		new_gate_1.color_update(color_2)
		new_gate_1.global_position=gate_pos
		new_gate_1.global_position.x-=1.5
		new_gate_1.global_position.y+=0.6
		var bar_pos=gate_pos
		bar_pos.z+=3.5
		add_random_seperate_barier(bar_pos,colour)
	else:
		var new_gate_0 = gate.instantiate()
		$gates.add_child(new_gate_0)
		new_gate_0.global_position=gate_pos
		new_gate_0.global_position.y+=0.6
		new_gate_0.color_update(colour)
		var bar_pos=gate_pos
		bar_pos.z+=3.5
		add_random_seperate_barier(bar_pos,colour)
var pack_1=preload("res://assets/tscn/cat_pack.tscn")
var pack_2=preload("res://assets/tscn/member_pivot.tscn")
var pack_3=preload("res://assets/tscn/member_pivot_2.tscn")
var pack_4=preload("res://assets/tscn/member_pivot_3.tscn")
func add_random_cat_pack(cat_pos):
	var randim=randi()
	if randim%9==0 or randim%9==1 or randim%9==8 :
		var new_pack = pack_1.instantiate()
		$members.add_child(new_pack)
		new_pack.global_position=cat_pos
		new_pack.global_position.x+=randf_range(-2.55,1.75)
		new_pack.single=true
	if randim%9==2 or randim%9==3 or randim%9==4:
		var new_pack = pack_2.instantiate()
		$members.add_child(new_pack)
		new_pack.global_position=cat_pos
		new_pack.global_position.x+=randf_range(-2.55,1.75)
	if randim%9==5  or randim%9==6 :
		var new_pack = pack_3.instantiate()
		$members.add_child(new_pack)
		new_pack.global_position=cat_pos
		new_pack.global_position.x+=randf_range(-2.55,1.75)
	if randim%9==7:
		var new_pack = pack_4.instantiate()
		$members.add_child(new_pack)
		new_pack.global_position=cat_pos
		new_pack.global_position.x+=randf_range(-2.55,1.75)


func random_color():
	var collor_array=[5,5,5,5,5]
	collor_array[0]=Color(0.808, 0.31, 0.698)#pembe
	collor_array[1]=Color(0.965, 0.329, 0.353)#kirmizi
	collor_array[2]=Color(0.459, 0.322, 0.949)#mor
	collor_array[3]=Color(0, 0.655, 0.655) #acik mavi 
	collor_array[4]=Color(0.733, 0.106, 0.396)#red
	
	return collor_array[randi()%5]

var gold_0=preload("res://assets/tscn/3_gold.tscn")


var cookie=preload("res://assets/tscn/food_cat.tscn")
func add_random_collectable(gold_pos):
	var randim=randi()
	if randim%3==0 or randim%3==1  :
		var new_pack = gold_0.instantiate()
		$collectables.add_child(new_pack)
		new_pack.global_position=gold_pos
		new_pack.global_position.y=0.680
	if randim%3==2:
		var new_pack = cookie.instantiate()
		$collectables.add_child(new_pack)
		new_pack.global_position=gold_pos
