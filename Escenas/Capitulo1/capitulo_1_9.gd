extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo19"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.9"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print(GameState.Droal)
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
	El mundo se reduce a instantes.

Tu espada sale de su vaina antes de que el segundo atacante termine de emerger de las sombras. El acero corta el aire con un silbido mortal, encontrando carne en el cuello del hombre. Su sangre salpica tu rostro, caliente y espesa. No hay tiempo para pensar—solo para actuar.

Goran es un torbellino de furia a tu lado. Su hacha Fauces de Hierro gira en un arco perfecto, destrozando el escudo de un enemigo como si fuera papel.

—¡Formación! —ruge, y aunque no sois soldados, sus años de experiencia os guían. Te colocas instintivamente a su izquierda, protegiendo su flanco vulnerable.

Hask sangra por el hombro, pero su risa sigue siendo tan afilada como su cuchillo.

—¡Ja! ¡Eso es todo lo que tenéis? —le escuchas escarbar en la herida de un hombre caído, retorciendo la hoja—. ¡Patético!

Lyssa baila a tu derecha, pura gracia letal. Sus dagas Susurro y Promesa tejen una red de muerte alrededor de los atacantes.

—¡Vamos, cariño! —le susurra a un soldado mientras su hoja perfora un pulmón—. ¡Muérdeme el acero!

Giras bruscamente al oír un jadeo. Hask ha perdido la concentración del combate. Ha estado recreandose en el sufrimiento del soldado abatido y ahora esta sufriendo el acoso de un soldado que aprobecha esa pequeña abertura de no tener la espada alzada. Tu espada intercepta un golpe dirigido a su cabeza.

—¡Atrás! —le gritas, empujándolo hacia la seguridad relativa de las rocas.

Es entonces cuando una voz en las sombras grita:

—¡Retirada! ¡Informad al—!

El mensaje se corta bruscamente. 

Los atacantes supervivientes huyen, pero su retirada no es ordenada. Es pánico puro.

Al cabo de pocos segundos, Silencioso emerge entre las sombras.

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
		"genero": GameState.genero,
		"Droal": GameState.Droal,
		"Hask": GameState.Hask,
		"Goral": GameState.Goral,
		"Silencioso": GameState.Silencioso,
		"Lyssa": GameState.Lyssa
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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-11.tscn")
