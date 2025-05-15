extends Button

func _on_pressed() -> void:
	var player_name = name_input.text.strip_edges()
	if player_name != "":
		GameState.player_name = player_name
		new_message_label.text = "%s... me apiado de tu alma por haber llegado a estas tierras, pero... ¿qué tipo de persona eres?" % player_name
	else:
		new_message_label.text = "Por favor, introduce un nombre válido."


	
