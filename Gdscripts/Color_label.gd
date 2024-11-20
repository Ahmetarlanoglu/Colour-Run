extends Label3D

var color
# Called when the node enters the scene tree for the first time.
func _ready():
	color=get_parent().color

	if color.r>0.8:
		text="Red"
	if color.b>0.8:
		text="Blue"
	if color.g>0.8:
		text="Green"
	if get_parent().not_default:
		text=get_parent().color_name


