extends Sprite3D

var spray_text0 = preload("res://assets/sprites/sprays/asdasd.png")
var spray_text2 = preload("res://export/spray_White.png")
var spray_text1 = preload("res://assets/sprites/sprays/pngwingwhite).png")
var spray_text3 = preload("res://assets/sprites/sprays/Sprite-0002.png")
var spray_text4 = preload("res://assets/sprites/sprays/Sprite-0003.png")

# Called when the node enters the scene tree for the first time.
func _ready():
#	visible=false
	$AnimationPlayer.play("simple")
	randomize()
	var my_random_integer=randi_range (1,4)
	var texture_variable="spray_text"+str(my_random_integer)
	texture=get(texture_variable)
	var random_boolean_0=randi_range(1,2)
	var _random_boolean_1=randi_range(1,2)
#	if random_boolean_0==1:
	flip_h=true
	if random_boolean_0==1:
		flip_v=true
#	rotation.x=1.2
	rotate_y(randf_range(12.2,1.8))
#	rotation.y=randf_range(1.2,1.8)
#func _process(delta):
#	Global.debugger=rotation
#	if Input.is_action_pressed("ui_down"):
#		rotation.y+=delta
#	if Input.is_action_pressed("ui_up"):
#		rotation.y-=delta

