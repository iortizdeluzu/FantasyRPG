extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo110"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.10"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	GameState.Hask = 0
	message_label.text = "
	El mundo se reduce a instantes.

Tu espada sale de su vaina antes de que el segundo atacante termine de emerger de las sombras. El acero corta el aire con un silbido mortal, encontrando carne en el cuello del hombre. Su sangre salpica tu rostro, caliente y espesa. No hay tiempo para pensar—solo para actuar.

Goran es un torbellino de furia a tu lado. Su hacha gira en un arco perfecto, destrozando el escudo de un enemigo como si fuera papel.

—¡Formación! —ruge, y aunque no sois soldados, los años de experiencia os guían. Te colocas instintivamente a su izquierda, protegiendo su flanco vulnerable.

Lyssa baila a tu derecha, pura gracia letal. Sus dagas Susurro y Promesa tejen una red de muerte alrededor de los atacantes. Uno de ellos estaba a punto de descubrirlo.

—¡Vamos, cariño! —le susurra a un soldado mientras su hoja perfora un pulmón—. ¡Muérdeme el acero!

Hask ríe mientras la sangre brota de su hombro, su cuchillo clavado en el vientre de un hombre.

—¡Ja! ¡Eso es todo lo que—

El grito se corta.

Lo ves demasiado tarde.

Hask se ha recreado en el sufrimiento de su víctima, su espada retorciéndose en la herida, y no ha visto al otro soldado acercarse por su flanco.

Te mueves.

Pero no eres lo bastante rápido.

Tu espada intercepta el golpe... pero no del todo. La hoja enemiga resbala contra la tuya y se hunde en el costado de Hask, justo bajo las costillas.

—¡Joder...! —jadea él, mirando con incredulidad la sangre que mana entre sus dedos.

Lyssa aparece como un relámpago, sus dagas destrozando la garganta del atacante.

—¡Idiota! —le gritas a Hask mientras lo arrastras hacia atrás, pero ya es demasiado tarde. La herida es profunda. Demasiado profunda.

Hask tose, escupiendo sangre.

—Mierda... —susurra, y su sonrisa, por primera vez, no es de burla—. Esto... esto duele más de lo que pensaba...

Sus dedos se aferran a tu brazo. Luego se quedan quietos.

Es entonces cuando una voz en las sombras grita:

—¡Retirada! ¡Informad al—!

El mensaje se corta bruscamente. 

Los atacantes supervivientes huyen, pero su retirada no es ordenada. Es pánico puro.

Al cabo de pocos segundos, Silencioso emerge entre las sombras y se acerca a la hoguera.

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
