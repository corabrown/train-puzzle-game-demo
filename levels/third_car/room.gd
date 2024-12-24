extends Node3D
class_name Room

var door_open: bool = false 
@onready var label: Label3D = $Door/Label3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var nancy_near: bool = false 

func _ready():
	label.visible = false 


func _on_door_area_body_entered(body: Node3D) -> void:
	if body is Nancy:
		nancy_near = true 
		label.visible = true
	
func _process(_delta: float) -> void:
	if nancy_near:
		if Input.is_action_just_pressed("interact"):
			change_door()

			
func _on_door_area_body_exited(body: Node3D) -> void:
	if body is Nancy: 
		nancy_near = false
		label.visible = false 
		
func change_door():
	if door_open:
		close_door()
		
	else:
		open_door()

func set_door(open: bool) -> void:
	if open:
		open_door()
	else:
		close_door()
	
func open_door():
	door_open = true
	label.text = "F to close"
	animation_player.play("open_door")
		
func close_door():
	door_open = false 
	label.text = "F to open"
	animation_player.play("close_door")
