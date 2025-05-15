extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo14"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.4"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
	Tu pulso se acelera antes de que tu mente termine de procesarlo. Eso no ha sido el viento. Tampoco una rata. El sonido ha sido demasiado hondo, demasiado deliberado. El aire huele a humedad podrida y a algo metálico, como cobre viejo. Tus pelos se erizan.
	Das tres pasos hacia la oscuridad. El calor del fuego se desvanece a tu espalda.
	
	Y entonces lo ves.
	
	Las sombras respiran.
	
	No son ilusiones. No son juegos de la luz. Se mueven con propósito, deslizándose entre las rocas como espectros en la noche."

func _on_menu_button_pressed() -> void:
	$MarginContainer/TopBar/MenuButton/PopupOpciones.popup()

func _on_popup_opciones_id_pressed(id: int) -> void:
	match id:
		0:
			print("Ir al menú principal")
			get_tree().change_scene_to_file("res://Main Menu.tscn")
		1:
			_guardar_partida()

func _guardar_partida():
	var save_data = {
		"nombre": GameState.player_name,
		"fuerza": GameState.fuerza,
		"inteligencia": GameState.inteligencia,
	   "carisma": GameState.carisma,
		"capitulo": GameState.capitulo_actual,
		"genero": GameState.genero
	}


	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(save_data)
		file.store_string(json_string)
		file.close()
		print("Partida guardada correctamente.")
	else:
		print("No se pudo guardar la partida.")


func _on_opcion_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-6.tscn")
