extends Resource
class_name Item

export(String) var name = ""
export(Texture) var texture
export(String, "Furniture", "Wallet", "Food", "Clothing") var itemType
export(String, "1x1", "1x2", "2x2" ) var size
