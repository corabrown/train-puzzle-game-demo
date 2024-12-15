extends Node3D

@export var previous_scene: PackedScene
@export var next_scene: PackedScene
@onready var nancy_return_position: Marker3D = $TrainCar/Car/NextCorridor/NancyReturnPosition
@onready var next_corridor: CSGBox3D = $TrainCar/Car/NextCorridor

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Nancy: 
		get_tree().change_scene_to_packed(next_scene)


func _on_next_corridor_transition_body_entered(body: Node3D) -> void:
	if (body is Nancy) && next_scene: 
		get_tree().change_scene_to_packed(next_scene)
		

func _ready():
	next_corridor.visible = false


#func _on_previous_corridor_transition_body_entered(body: Node3D) -> void:
	#print("DSFHDJ")
	#print(previous_scene)
	#if (body is Nancy) && previous_scene: 
		#print("DFHSJKDFH")
#w		previous_scene.get_node("Nancy").position = nancy_return_position
		#get_tree().change_scene_to_packed(previous_scene)
