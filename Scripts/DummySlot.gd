extends Node2D

#node exists to prevent Floorslot declaring adjacent slot null instance
signal item_placed
signal item_unplaced
signal furniture_type(item)

var placedFurniture = null
