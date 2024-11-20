extends StaticBody3D
var time=0
@export var color:Color
@export var radim=randi_range(0,100)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#	$Node/top.global_position=global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	rotation.x=sin(time*2+radim)
	
