extends Node3D
@onready var cars: Node3D = $Cars


func _ready():
	for car in cars.get_children():
		for component in car.get_children():
			if component is TrainCar:
				component.set_next_corridor_invisible()
