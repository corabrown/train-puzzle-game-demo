extends Node3D

@export var next_corridor: CSGBox3D
@onready var rooms: Node3D = $"../Rooms"
@onready var password_display: CSGBox3D = $PasswordDisplay
@onready var winning_text: Label3D = $"../WinningText"

var password: Array[int] = [0,1,1,0,1]
var current_password: Array[int] = [1,1,1,1,1]


func _ready() -> void:
	winning_text.visible = false
	next_corridor.visible = false 
	password_display.visible = true 

func _process(_delta: float) -> void:
	for room_number in rooms.get_children().size():
		var room = rooms.get_child(room_number)
		if room is Room:
			if room.door_open: 
				current_password[room_number] = 0
			else:
				current_password[room_number] = 1
								
	if current_password == password:
		next_corridor.visible = true 
		password_display.visible = false 
		winning_text.visible = true 
	
