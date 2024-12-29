extends Path3D
@onready var path_follow_3d: PathFollow3D = $PathFollow3D

func _physics_process(delta: float) -> void:
	const move_speed := 100
	path_follow_3d.progress += move_speed * delta 
