extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo18"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.8"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
	La hoguera crepitaba, baja ya, sus llamas agonizantes pintando rostros cansados. Te frotas los ojos, convencido de haber imaginado aquel sonido entre las rocas. Quizá solo fue el viento, piensas, mientras Hask lanza otro chiste obsceno y Goran gruñe por enésima vez.
Entonces el mundo estalla en violencia.

Un silbido.

Un chillido.

Droal se incorpora de golpe, los ojos muy abiertos, la boca formando una \"O\" perfecta.
La flecha le atraviesa la garganta con un plop húmedo.
Por un instante grotesco, parece querer hablar. Sus dedos se enganchan al astil de madera, como si pudiera deshacer lo ocurrido. Luego cae de rodillas, y la sangre brota a borbotones entre sus dedos, negra a la luz del fuego.
El caos estalla.
Goran ruge como un oso herido, su hacha Fauces de Hierro girando sobre su cabeza antes de estrellarse contra el pecho del primer soldado que emerge de las sombras. Las costillas crujen como ramas secas.
Hask recibe una flecha en el hombro, pero ni siquiera parece notarlo. Su cuchillo encuentra un ojo, luego una yugular.— ¡Esto es por el chico, cabrones! —escupe rojo escarlata salpicándole los dientes rotos.
Lyssa baila entre dos atacantes, sus dagas dibujando arabescos mortales. Uno cae con la femoral abierta, el otro ahogándose en su propia sangre. 
El Silencioso... no lucha. Se limita a apartarse de una flecha que iba directa a su corazón, como si supiera exactamente dónde estaría. Sus ojos no dejan de mirar más allá de los atacantes, hacia la oscuridad absoluta.
Droal se desploma de costado, sus ojos vidriosos reflejando las llamas por última vez. Un hilo de saliva y sangre le corre por la barbilla. Su espada, esa espada demasiado grande para él, yace inútil en el polvo.
Los atacantes —cinco, quizá seis— retroceden cuando Goran arranca literalmente la cabeza de uno de ellos. \"¡No bastará!\", grita un hombre con capucha antes de huir cojeando, dejando atrás a sus compañeros moribundos."


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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-9.tscn")
