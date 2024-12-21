extends Node3D

class_name InventoryItem
@onready var pickup_label: Label3D = $PickupLabel

@export var Name: String = ""
@export var texture: Texture2D

var nancy_in_zone: bool = false 

func _ready():
	pickup_label.visible = false 

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Nancy:
		nancy_in_zone = true 
	
		pickup_label.visible = true 

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Nancy:
		nancy_in_zone = false 

		pickup_label.visible = false 


func _input(event: InputEvent) -> void:
	if nancy_in_zone:
		if event.is_action_pressed("interact"):
			pass 
