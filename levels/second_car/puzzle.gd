extends Node3D

@onready var instructions: Label3D = $Instructions

var in_puzzle_zone := false 

@onready var coffee: Node3D = $Food/Coffee
@onready var tea: Node3D = $Food/Tea
@onready var frappe: Node3D = $Food/Frappe

@onready var objects = [coffee, tea, frappe]
@export var corridor: CSGBox3D


var selected_index := -1

func _ready() -> void:
	corridor.visible = false 
	coffee.used.connect(puzzle_finished)

func _on_puzzle_area_body_entered(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = true 
		instructions.visible = true 
		coffee.usable = true 


func _on_puzzle_area_body_exited(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = false 
		instructions.visible = false 
		coffee.usable = false

func puzzle_finished():
	instructions.text = "Thanks!"
	corridor.visible = true 
