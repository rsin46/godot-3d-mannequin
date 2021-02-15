tool
class_name Player
extends KinematicBody
# Helper class for the Player scene's scripts to be able to have access to the
# camera and its orientation.

onready var camera: CameraRig = $CameraRig
onready var skin: Mannequiny = $Mannequiny
onready var state_machine: StateMachine = $StateMachine

export (NodePath) var joystickLeftPath
onready var joystickLeft : Joystick = get_node("../UI/Joystick")


func _get_configuration_warning() -> String:
	return "Missing camera node" if not camera else ""
#
func _ready():
	print(joystickLeft.is_working)

func _physics_process(_delta):
	if joystickLeft and joystickLeft.is_working:
			# Send to input map
		var jm_x = InputEventJoypadMotion.new()
		jm_x.axis = 0
		jm_x.axis_value = joystickLeft.output.x
		Input.parse_input_event(jm_x) 

		var jm_y = InputEventJoypadMotion.new()
		jm_y.axis = 1
		jm_y.axis_value = joystickLeft.output.y
		Input.parse_input_event(jm_y) 

	elif not (Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_D)):
		var jm_x = InputEventJoypadMotion.new()
		jm_x.axis = 0
		jm_x.axis_value = 0
		Input.parse_input_event(jm_x) 

		var jm_y = InputEventJoypadMotion.new()
		jm_y.axis = 1
		jm_y.axis_value = 0
		Input.parse_input_event(jm_y) 

		
