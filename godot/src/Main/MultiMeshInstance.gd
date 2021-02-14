extends MultiMeshInstance


func _ready():
	populate(50, 10)

func populate(instances, scale):
	multimesh = MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.mesh = CylinderMesh.new()
	multimesh.instance_count = instances
	multimesh.visible_instance_count = -1
	for i in multimesh.instance_count:
		multimesh.set_instance_transform(i, Transform( Vector3(0.5,0,0), Vector3(0,rand_range(scale/2,scale),0), Vector3(0,0,0.5), Vector3(rand_range(-20,20),0,rand_range(-20,20))))
