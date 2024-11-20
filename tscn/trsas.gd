extends Node3D
var speed

@export var background_color:Color
@export var light_color:Color
# Called when the node enters the scene tree for the first time.
func _ready():
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
	$enviroment/CanvasLayer/Label.text=str(Global.debugger)
#	Global.debugger=Global.pos
#	$finish/salmon_fish/Sketchfab_model/e5af0b77e1ee488c94a9e0740d42756dfbx/RootNode/Cube018/Cube018_Material010_0.rotate_y(delta)

func _on_area_3d_area_entered(_area):
	pass # Replace with function body.

func _on_area_3d_body_entered(body):
	body.global_position.x+=1
	body.global_position.y+=1
