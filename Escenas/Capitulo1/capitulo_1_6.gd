extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo16"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.6"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = "
Tu cuerpo reacciona antes que tu mente. Te giras bruscamente, el acero de tu espada desenvainándose con un sonido que corta la noche como un lamento.
—¡A las armas! —ruges, y el campamento estalla en caos controlado.
Hask es el primero en moverse, su risa macabra convirtiéndose en un gruñido de bestia acorralada. Escupe al suelo y saca su cuchillo curvo, la hoja manchada de viejas rencillas. Con un movimiento fluido, se coloca de espaldas a la hoguera, los ojos brillando con reflejos dementes—. ¡Venid, hijos de puta! ¡A ver si sabéis morir como hombres!
Goran se alza como una torre de carne y rabia, su hacha girando en un arco mortal sobre su cabeza.
—¡Formación! —brama, y aunque no sois soldados, los años de sangre compartida os han enseñado a moveros como lobos en manada. Su hacha, brilla con el reflejo de las llamas, las runas en su filo destellando con hambre antigua—. Droal, ¡mi flanco izquierdo! ¡Lyssa, cubre nuestras espaldas!
Lyssa no necesita órdenes. Ya está en movimiento, sus dagas gemelas, Susurro y Promesa, trazando círculos plateados en el aire.
—Oh, esto sí que es divertido —murmura, deslizándose como una sombra entre las rocas. Su risa es un cuchillo más—. Vamos, cariño. Dame un motivo para ensartarte.
Droal, el pobre Droal, tiene los ojos como platos y las manos temblorosas, pero sorprendentemente, no huye.
—P-por el honor del Rey… —farfullá, desenvainando su espada con torpeza. Goran le lanza una mirada que podría partir piedras, y el chico se endereza, imitando la postura del veterano—. ¡E-estoy listo!
El Silencioso… no se mueve. Pero sus ojos… sus ojos siguen las sombras que se arrastran hacia vosotros con la calma de un hombre que ya ha visto este juego antes.
Y entonces, las sombras atacan."

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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-8.tscn")
