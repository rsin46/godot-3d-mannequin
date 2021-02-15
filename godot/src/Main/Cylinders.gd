extends MultiMeshInstance

var height

func _ready():
	populate(50, 10)

func populate(instances, scale):
	multimesh = MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.mesh = CylinderMesh.new()
	multimesh.instance_count = instances
	multimesh.visible_instance_count = -1
	
	# Re-use the same shape
	var shape = multimesh.mesh.create_trimesh_shape()
	# Create one static body
	var collisionNode = StaticBody.new()
	var mmi = MultiMeshInstance.new()
	mmi.multimesh = multimesh;
	mmi.add_child(collisionNode)
	
	add_child(mmi)
	
	for i in multimesh.instance_count:
		height = rand_range(1,scale)
		var position = Transform( Vector3(0.5,0,0), Vector3(0,height,0), Vector3(0,0,0.5), Vector3(rand_range(-20,20),height,rand_range(-20,20)))
		multimesh.set_instance_transform(i, position)
		
		# Create many collision shapes
		var collisionShape = CollisionShape.new()
		collisionShape.shape = shape
		collisionShape.transform = position
		collisionNode.add_child(collisionShape)
