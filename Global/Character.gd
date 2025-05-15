extends Node
class_name Character

var character_name: String = "Hola"
var max_hp: int = 20
var hp: int = max_hp
var atk: int = 5
var def: int = 3
var inventory: Array = []
var weapons: Array = []

func to_dict() -> Dictionary:
	return {
		"name": name,
		"hp": hp,
		"max_hp": max_hp,
		"atk": atk,
		"def": def,
		"inventory": inventory,
		"weapons": weapons,
	}

func from_dict(data: Dictionary) -> void:
	name = data.get("name", name)
	hp = data.get("hp", hp)
	max_hp = data.get("max_hp", max_hp)
	atk = data.get("atk", atk)
	def = data.get("def", def)
	inventory = data.get("inventory", [])
	weapons = data.get("weapons", [])
