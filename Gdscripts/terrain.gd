extends MeshInstance3D


@export var mesh_scale=5 

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var random_point=Vector2(randf_range (0.2,0.3),randf_range (0.2,0.3)) # Replace with function body.
#	self.get_surface_override_material(0).set_shader_parameter("uv_scaler",mesh_scale)
#	self.material_override.set_shader_param("uv_scaler",mesh_scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
var guard=true
func _process(delta):
	if $StaticBody3D.collided and guard:
#		guard=false
		var distance=($StaticBody3D.colliding_point-global_position)
		self.get_surface_override_material(0).set_shader_parameter("random_point",Vector2((distance.x/mesh.size.x)+0.5,(distance.z/mesh.size.y)-0.5))
		Global.debugger=self.get_surface_override_material(0).get_shader_parameter("random_point")
		await  get_tree().create_timer(0.2).timeout
		get_surface_override_material(0).set_shader_parameter("released",true)
