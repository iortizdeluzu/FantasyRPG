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
	El silencio se rompe en mil pedazos.

Una flecha silba junto a tu oreja, tan cerca que el aire al desplazarse te quema como un látigo de fuego. Alcanzas a sentir el roce de las plumas contra tu piel antes de que el proyectil se clave con un seco sonido \"thunk\" en el tronco donde, un segundo antes, Hask apoya la cabeza.

—¡Hijos de perra! —ruge Hask, sus ojos inyectados en sangre mientras escupe al suelo—. ¡Nos quieren enterrar aquí!

Goran se alza como una torre de músculo y rabia.

—¡Droal, mueve el culo o te lo corto yo mismo! —brama mientras empuja al muchacho detrás de una roca. Justo a tiempo. Otra flecha se estrella contra la piedra donde el joven estaba, astillando el aire con su impacto.

Te abalanzas hacia adelante, tu espada encuentra el vientre blando de un atacante que emerge de las sombras. La hoja se hunde hasta la empuñadura, caliente y pegajosa. El hombre cae con un gemido, pero no hay tiempo para celebrar—otro ya viene hacia ti, su hacha levantada.

Lyssa no necesita aviso. Ya es una sombra entre las sombras, sus dagas gemelas, Susurro y Promesa, trazando líneas plateadas en la oscuridad.

—¡Cinco ratas visibles! —grita mientras su primera cuchillada encuentra la garganta de un atacante. La sangre brota negra a la luz de la luna—. ¡Y más escondidas como cobardes!

No ves a Silencioso pero deduces que esta haciendo alguna de las suyas. Es el mejor buscando el punto debil del enemigo.

Hask carga como un toro herido, su cuchillo hundiéndose en el vientre de un hombre con armadura gastada. La hoja sale roja, pero el enemigo no cae. En cambio, responde con un codazo que parte el labio de Hask en dos.

Droal, el pobre Droal, se agacha como un conejo acorralado. Pero cuando un soldado se abalanza sobre él, su espada se alza por puro instinto. El acero encuentra carne, y el chico grita casi tan fuerte como el hombre que se desploma sobre él, chorreando vida por el costado.

—¡L-lo hice! —jadea, mirando sus manos manchadas con ojos desorbitados.

Los atacantes, maldita sea, son buenos. Pero vosotros sois mejores.

Goran arranca un brazo de un solo tajo, y el dueño de ese brazo aúlla como un animal herido antes de desplomarse. Lyssa baila entre dos enemigos, dejando a uno desangrándose con una sonrisa y al otro ahogándose en su propia sangre.

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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-9.tscn")
