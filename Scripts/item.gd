extends Resource
class_name Item

export(String) var name = ""
export(Texture) var texture
export(String, "Furniture", "Wallet", "Food", "Clothing") var itemType
export(String, "1x1", "2x1", "2x2", "rug") var size
