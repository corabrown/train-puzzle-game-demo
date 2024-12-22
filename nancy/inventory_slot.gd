extends Node
class_name InventorySlot

var item: InventoryItem 
var quantity: int

@onready var icon: TextureRect = $Icon
@onready var label: Label = $Label

var inventory: Inventory

func set_item(new_item: InventoryItem):
	item = new_item
	
	if item == null:
		icon.visible = false
		label.text = ""
	else:
		icon.visible = true
		icon.texture = item.texture 
		label.text = item.item_name

func remove_item():
	set_item(null)
	
func update_quantity_text():
	pass 

func _on_pressed() -> void:
	if (item != null) and (item.usable):
		item.used.emit()
		remove_item()
		inventory.toggle_window(false)

	return 
