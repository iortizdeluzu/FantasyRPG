extends LineEdit

@onready var name_input = $LineEdit  # Ajusta según el nodo real


func _on_continue_bu_pressed():
	var player_name = name_input.text
	# Guardar el nombre para usarlo más tarde
	get_tree().change_scene_to_file("res://Main Menu.tscn")


func _on_pressed() -> void:
	pass # Replace with function body.
