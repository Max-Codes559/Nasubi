extends Resource
class_name Item

export(String) var name = ""
export(Texture) var texture
export(String, "Furniture", "Wallet", "Food", "Clothing") var itemType
export(String, "1x1", "1x2", "2x2", "tall", "rug") var size
export(String, "hat", "shirt", "pants", "shoes") var clothingType

export(int, 0, 5) var lightLevel
export(Color) var lightColor = Color(1, 1, 1)

export(int, 0, 100) var foodValue = 0

export(int) var moneyValue = 0
