extends Area3D
var timer=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	position.y=(cos(timer)/5)-0.7
#	rotation_degrees.y=timer*100


func _on_area_entered(_area):
	Global.money+=10
	queue_free()
