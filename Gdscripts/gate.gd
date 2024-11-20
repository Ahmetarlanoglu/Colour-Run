extends Area3D

@export var color:Color
@export var color_name:String
@export var not_default=false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Color_label.color=color
	$in_gate.get_surface_override_material(0).set_shader_parameter("adding_color",color)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	
	if body.is_in_group("player"):
		body.color_update(color)
func color_update(colour):
	$in_gate.get_surface_override_material(0).set_shader_parameter("adding_color",colour)
	if colour==Color(0.808, 0.31, 0.698):$Color_label.text="Pink"#pembe
	if colour==Color(0.965, 0.329, 0.353):$Color_label.text="Red"#kirmizi
	if colour==Color(0.459, 0.322, 0.949):$Color_label.text="Purple"#mor
	if colour==Color(0, 0.655, 0.655):$Color_label.text="Blue" #acik mavi 
	if colour==Color(0.733, 0.106, 0.396):$Color_label.text="Red"#red
	color=colour
