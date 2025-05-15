extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo12"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.2"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
		Respiras hondo, forzando tus músculos a relajarse. No fue nada. Te concentras en las llamas, en su danza hipnótica, en su calor que ya no calienta.
		—Qué puto asco de noche —masculla Hask—. Me pregunto si el gran Rey Loktar está tan cómodo en su trono de oro mientras nosotros nos comemos el polvo.
		Goran gruñe, pero esta vez hay algo distinto en su voz. No es una advertencia. Es... complicidad.
		—Dicen que los Altos Nobles de Vorthal no están contentos —rumia el gigante, pasando un dedo por el filo de su hacha—. Que las Piedras de Poder deberían ser de todos, no solo suyas.
		Lyssa ríe, un sonido afilado como el roce de sus dagas.
		—¿Y qué harán? ¿Enviar ejércitos? —sus ojos brillan con malicia—. Loktar tiene estas minas bien custodiadas... aunque la guardia sea pobres bastardos como nosotros.
		Droal, el joven, parpadea rápidamente.
		—P-pero... ¿y si vienen? ¿Si nos atrapan en medio?
		El Silencioso, por primera vez en horas, habla.
		—Los Altos Nobles no tolerarán por mucho tiempo que Loktar monopolice las minas —dice en voz baja—. Sus espías ya merodean por la zona.
		—P-pero si los nobles se rebelan... si el Consejo... —dice Droal mientras se ajusta el yelmo con manos temblorosas.
		—No les importa una mierda lo que pase —susurra con voz de tumba abierta—. Tan solo buscan el poder."
	

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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-7.tscn")
