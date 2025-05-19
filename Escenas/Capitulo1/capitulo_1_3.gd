extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo13"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.3"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
	Tus dedos se cierran alrededor del puño de la espada antes de que te des cuenta. Algo se mueve ahí fuera, y no es el viento.
	
	Te levantas con movimientos calculados, evitando hacer ruido.
	
	—¿Eh? ¿Adónde vas, loco? —Hask arquea una ceja, pero no se mueve del tronco donde está apoyado.
	
	Los demás apenas alzan la vista:
	
	Goran sigue afilando su hacha, pero sus ojos te siguen entre las llamas. Lyssa detiene el giro de sus dagas, sonriendo como un gato ante un ratón herido. Droal se encoge aún más, como si quisiera desaparecer. El Silencioso... simplemente observa.
	
	"

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
	print("Inteligencia actual:", GameState.inteligencia)
	if  GameState.inteligencia >= 5:
		get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-4.tscn")
	else:
		get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-5.tscn")
