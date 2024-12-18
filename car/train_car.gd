extends Node3D
class_name TrainCar

@onready var next_corridor: CSGBox3D = $Car/NextCorridor

func set_next_corridor_invisible():
	next_corridor.visible = false 
