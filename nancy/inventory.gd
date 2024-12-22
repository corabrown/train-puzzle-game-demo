extends Node
class_name Inventory

var slots: Array[InventorySlot]
@onready var inventory_window: Panel = $InventoryWindow
@onready var label: Label = $InventoryWindow/Label
@onready var slot_container: GridContainer = $InventoryWindow/SlotContainer
@export var starter_items: Array[InventoryItem]


func _ready() -> void:
	toggle_window(false)
	
	for child in slot_container.get_children():
		slots.append(child)
		child.set_item(null)
		child.inventory = self 
		
	for item in starter_items:
		add_item(item)

func _process(delta) -> void:
	if Input.is_action_just_pressed("inventory"):
		toggle_window(!inventory_window.visible)

func toggle_window (open : bool) -> void:
	inventory_window.visible = open 

	if open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	else: 
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func add_item(item: InventoryItem) -> void:
	var slot = get_slot_to_add(item)
	
	if slot == null:
		return  
	
	if slot.item == null:
		slot.set_item(item)

func get_slot_to_add(item: InventoryItem) -> InventorySlot:
	for slot in slots: 
		if slot.item == null:
			return slot
			
	return null 
	
func get_slot_to_remove(item: InventoryItem) -> InventorySlot:
	for slot in slots:
		if slot.item == item:
			return slot 
			
	return null 
