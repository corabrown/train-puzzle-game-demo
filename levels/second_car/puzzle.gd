extends Node3D

@onready var instructions: Label3D = $Instructions

var in_puzzle_zone := false 

@onready var coffee: Node3D = $Food/Coffee
@onready var tea: Node3D = $Food/Tea
@onready var frappe: Node3D = $Food/Frappe
@onready var frappe_pickup: Label3D = $Food/Frappe/FrappeArea/FrappePickup
@onready var coffee_pickup: Label3D = $Food/Coffee/CoffeeArea/CoffeePickup
@onready var tea_pickup: Label3D = $Food/Tea/TeaArea/TeaPickup

@onready var objects = [coffee, tea, frappe]
@onready var next_corridor: CSGBox3D = $"../TrainCar/Car/NextCorridor"

var selected_index := -1

func _process(_delta:float):
	next_corridor.visible = true 

func _on_puzzle_area_body_entered(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = true 
		instructions.visible = true 


func _on_puzzle_area_body_exited(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = false 
		instructions.visible = false 


func _on_frappe_area_body_entered(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = 2
		frappe_pickup.visible = true 


func _on_frappe_area_body_exited(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = -1
		frappe_pickup.visible = false 
	 

func _on_tea_area_body_entered(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = 1
		tea_pickup.visible = true 


func _on_tea_area_body_exited(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = -1
		tea_pickup.visible = false 


func _on_coffee_area_body_entered(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = 0
		coffee_pickup.visible = true 


func _on_coffee_area_body_exited(body: Node3D) -> void:
	if body is Nancy: 
		selected_index = -1
		coffee_pickup.visible = false 
