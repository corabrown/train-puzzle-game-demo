extends "res://levels/level.gd"
@onready var previous_corridor: CSGBox3D = $TrainCar/Car/PreviousCorridor


func _ready():
	previous_corridor.visible = false
	
