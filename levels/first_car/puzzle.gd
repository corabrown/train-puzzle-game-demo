extends Node3D
@onready var instructions: Label3D = $Instructions
@onready var first_number: CSGBox3D = $Password/FirstNumber
@onready var second_number: CSGBox3D = $Password/SecondNumber
@onready var third_number: CSGBox3D = $Password/ThirdNumber
@onready var first_label_3d: Label3D = $Password/FirstNumber/Label3D
@onready var second_label_3d: Label3D = $Password/SecondNumber/Label3D
@onready var third_label_3d: Label3D = $Password/ThirdNumber/Label3D
@onready var password: Node3D = $Password
#@onready var corridor: CSGBox3D = $"../TrainCar/Car/NextCorridor"

var first_label_3d_text := 0 
var in_puzzle_zone := false

var selected_index: int = 0

var current_password := [0, 0, 0]
@onready var numbers := [first_number, second_number, third_number]

@export var corridor: CSGBox3D 

var answer = [6,4,8]


func _ready() -> void:
	instructions.visible = false 
	corridor.visible = false 
	#first_label_3d.text = str(first_label_3d_text)
	
func _process(_delta: float) -> void:
	first_label_3d.text = str(current_password[0])
	second_label_3d.text = str(current_password[1])
	third_label_3d.text = str(current_password[2])
	
	if current_password == answer:
		password.visible = false 
		corridor.visible = true 
		

func _input(event: InputEvent):
	
	if in_puzzle_zone: 
		if event.is_action_pressed("arrow_down"):
			current_password[selected_index] = (current_password[selected_index] + 9) % 10
			
		if event.is_action_pressed("arrow_up"):
			current_password[selected_index] = (current_password[selected_index] + 11) % 10
			
		if event.is_action_pressed("arrow_right"):
			selected_index = (selected_index + 1) % 3
			set_backlight()
			
		if event.is_action_pressed("arrow_left"):
			selected_index = (selected_index - 1 + 3) % 3
			set_backlight()
			

func set_backlight():
	for index in numbers.size():
		if index == selected_index:
			numbers[index].material.backlight_enabled = true
		else: 
			numbers[index].material.backlight_enabled = false 
		
func remove_backlight():
	for index in numbers.size():
		numbers[index].material.backlight_enabled = false	

func _on_puzzle_area_body_entered(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = true 
		instructions.visible = true 
		set_backlight()


func _on_puzzle_area_body_exited(body: Node3D) -> void:
	if body is Nancy:
		in_puzzle_zone = false 
		instructions.visible = false 
		first_number.material.backlight_enabled = false 
