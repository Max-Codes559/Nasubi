extends Resource
class_name Inventory

signal items_changed(indexes)

export(Array, Resource) var items =[
null, null, null, null, null, null, null, null, null	
]

func set_item(item_index, item):
	var previousItem = items[item_index]
	#stores previous item
	items[item_index] = item
	#sets new item in array
	emit_signal("items_changed", [item_index])
	print("item placed")
	return previousItem

func swap_items(item_index, target_item_index):
	#unimplimented
	var targetItem = items[target_item_index]
	var item = items[item_index]
	
	items[target_item_index] = item
	items[item_index] = targetItem
	#swaps items
	emit_signal("items_changed", [item_index, target_item_index])
	print("items swapped")
	
func remove_item(item_index):
	var previousItem = items[item_index]
	items[item_index] = null
	emit_signal("items_changed", [item_index])
	print("item removed")
	return previousItem
