extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://GameIntro.tscn") # Replace with function body.
	reiniciar_estado()

func reiniciar_estado():
	GameState.player_name = ""
	GameState.fuerza = 0
	GameState.inteligencia = 0
	GameState.carisma = 0
	GameState.capitulo_actual = "1.1"  # o el valor inicial que quieras
	GameState.genero = ""
	GameState.Droal = 1
	GameState.Hask = 1
	GameState.Goral = 1
	GameState.Silencioso = 1
	GameState.Lyssa = 1
