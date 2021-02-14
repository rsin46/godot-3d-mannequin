extends Spatial


# Declare member variables here. Examples:
var redraw = 20
var num_draws = 1

onready var ground = get_node("Ground")
onready var player = get_node("../Player")
onready var cylinders = get_node("Cylinders")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
#	ground.mesh.size = Vector2(50,50)
#	ground.create_convex_collision()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
#	if (player.global_transform.origin.z > redraw * num_draws):
##		ground.translate(Vector3(0,0,0.1))
#		ground.translation.z += redraw
#		num_draws += 1
	pass

#func _on_Area_body_exited(body):
#	ground.translation.z += redraw

func _on_Area_body_entered(body):
	ground.translation.z += redraw
	cylinders.translation.z += redraw
	
func _on_Area2_body_shape_entered(body_id, body, body_shape, area_shape):
	ground.translation.z -= redraw
	cylinders.translation.z -= redraw
