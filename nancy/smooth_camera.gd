extends Camera3D

#@onready var ray_cast_3d: RayCast3D = $RayCast3D

@export var speed := 44.0

func _physics_process(delta: float) -> void:
	
	var weight = clamp(delta * speed, 0.0, 1.0)
	
	global_transform = global_transform.interpolate_with(
		get_parent().global_transform,
		weight,
	)

	global_position = get_parent().global_position


#func _process(_delta: float) -> void:
	#var mouse_position: Vector2 = get_viewport().get_mouse_position()
	#ray_cast_3d.target_position = project_local_ray_normal(mouse_position)
	#Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	#
	##ray_cast_3d.force_raycast_update()
	#
	##print(mouse_position)
	#
