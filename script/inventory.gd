extends Resource

class_name Inventory

signal updated

@export var slots: Array[InventorySlot]


func insert(item: InventoryItem):
	var itemSlots = slots.filter(func(slot): return slot.item == item)
	if !itemSlots.is_empty():
		itemSlots[0].amount += 1
	else:
		var emptySlots = slots.filter(func(slot): return slot.item == null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
	
	updated.emit()
	
func removeSlot(inventorySlot: InventorySlot):
	var index = slots.find(inventorySlot)
	if index < 0 : return
	
	remove_at_index(index)

func remove_at_index(index: int):
	slots[index] = InventorySlot.new()
	updated.emit()

func insertSlot(index: int, inventorySlot: InventorySlot):
	slots[index] = inventorySlot
	updated.emit()


func use_item_at_index(index: int):
	if index < 0 || index >= slots.size() or !slots[index].item:
		return
		
	var slot = slots[index]
	# No eliminar si el ítem es la spear
	
	if slot.item.name == "spear":
		updated.emit()
		return
	
	if slot.amount > 1:
		slot.amount -= 1
	else:
		remove_at_index(index)

	updated.emit()
