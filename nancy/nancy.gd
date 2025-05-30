extends CharacterBody3D
class_name Nancy


@export var inventory: Inventory

@onready var camera_pivot: Node3D = $CameraPivot
@onready var smooth_camera: Camera3D = $CameraPivot/SmoothCamera
@onready var smooth_camera_fov = smooth_camera.fov
#@onready var inventory_ui: Node3D = $CanvasLayer/InventoryUI

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_motion = Vector2.ZERO
const step_travel_distance = 100

enum cursor_type {LEFT, RIGHT, FORWARD, BACK, LOOK_CLOSER}
var cursor_image := {
	cursor_type.LEFT: Control.CURSOR_CROSS,
	cursor_type.RIGHT: Control.CURSOR_ARROW,
	cursor_type.FORWARD: Control.CURSOR_ARROW,
	cursor_type.BACK: Control.CURSOR_ARROW,
	cursor_type.LOOK_CLOSER: Control.CURSOR_ARROW,
}
@onready var current_cursor_type = cursor_type.FORWARD

func _ready() -> void: 
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _process(delta: float) -> void:
	smooth_camera.fov = lerp(
		smooth_camera.fov,
		smooth_camera_fov,
		delta * 30.0
		)
		

func _physics_process(delta: float) -> void:
	handle_camera_rotation()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			mouse_motion = -event.relative * 0.001
			
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func handle_camera_rotation() -> void: 
	rotate_y(mouse_motion.x)
	camera_pivot.rotate_x(mouse_motion.y)
	camera_pivot.rotation_degrees.x = clampf(
		camera_pivot.rotation_degrees.x,
		-90.0,
		90.0,
	)
	mouse_motion = Vector2.ZERO
