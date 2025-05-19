extends Control

@onready var scroll_container = $ScrollContainer
@onready var boton1 = $"ScrollContainer/VBoxContainer/HBoxContainer/Opcion 1"
@onready var message_label = $"ScrollContainer/VBoxContainer/Capitulo112"


# Capítulo actual de la escena (puedes cambiarlo en cada escena)
var capitulo_actual = "1.12"  # Esto lo ajustas en cada escena diferente

func _ready():
	GameState.capitulo_actual = capitulo_actual
	print("Capítulo actualizado a:", GameState.capitulo_actual)
	message_label.text = " 
Los cadáveres enemigos yacen alrededor. Te limpias la hoja de tu espada con un trapo sucio, los nudillos doloridos por el forcejeo del combate. El acero reluce débilmente al reflejar el fuego, pero ya no brilla como antes. Nada brilla igual después de la sangre.
"
	if GameState.Droal >= 1:
		message_label.text += "
		Goran se desploma junto a ti. Su respiración es pesada, y cuando te mira, ves que la barba que siempre llevó orgullosa está manchada de rojo oscuro. No es su sangre, pero eso no parece consolarle.
		
		—Estamos completos —ruge, escupiendo al suelo—. Por ahora.
		
		Lyssa juguetea con sus dagas, limpias pero no del todo. Algo en su mirada ha cambiado; esa chispa de diversión sádica se ha apagado un poco.
		
		—Cinco contra nosotros, y ninguno cayó —musita, pasando el pulgar por el filo de una daga—. O somos muy buenos... o ellos muy malos.
		
		Hask se sienta con dificultad, presionando un jirón de tela contra su costado herido. Su sonrisa habitual se ha vuelto una mueca dolorida, pero el brillo en sus ojos sigue siendo el mismo.
		
		—Joder, esto escuece más que el vino de aquel burdel en Karak —bromea, pero su voz pierde fuerza a mitad de la frase. Una tos le sacude, y cuando aparta la mano, ves sangre en sus labios.
		
		Droal tiembla como una hoja en medio del círculo, sus manos limpias pero su mirada perdida en algún punto entre las llamas y la oscuridad. Ha matado por primera vez esta noche, y el peso de eso se ve en sus ojos.
		
		—L-lo hice... —balbucea, mirando sus palmas como si esperara verlas manchadas—. Dioses, lo hice...
		
		"
	
	elif  GameState.Droal <= 0 and GameState.Hask >= 1:
		message_label.text += "
		Tus ojos se posan en el pequeño cuerpo junto a las rocas. Droal yace boca arriba. La flecha en su garganta parece un accesorio grotesco, el astil de madera sobresaliendo de su cuello.
		
		Goran se arrodilla junto al muchacho con un sonido que podría ser un gruñido o un sollozo ahogado. Sus enormes manos, capaces de destrozar cráneos, cierran los párpados de Droal con sorprendente delicadeza.
		
		—No debería haber estado aquí —murmura, su voz más áspera de lo habitual—. Era sólo un niño.
		
		Lyssa está quieta por primera vez en tu memoria. Se acerca y, sin mediar palabra, ata un paño alrededor del cuello de Droal, ocultando la herida. Tras ese breve gesto de respeto al cuerto, se acerca a Goral y le apolla la mano en el hombro, sabiendo que el grandullo lo pasa mal cuando sus compañeros mueres.
		
		No es el caso de Hask, que su boca se tuerce en una mueca que pretende ser sonrisa. 
		
		—Bueno... al menos el mocoso ya no tendrá que preocuparse por afeitarse —dice, mirando el cadáver de Droal—. Mierda, con lo que le costaba levantar esa espada... Ahora ni siquiera puede levantar los párpados.
		
		El chiste cae como un hachazo en carne viva. Goran levanta la cabeza lentamente, sus nudillos palideciendo alrededor del mango de su arma.
		
		En un gesto rapido Lyssa le coge la mano que empuña el arma mientras le mira a los ojos, como suplicando. Parecen decirle \"con una muerte es suficiente\" 
		
		Hask mira alrededor, su sonrisa desentonando cada vez más.
		
		—¿Qué? Si el chico siempre decía que quería ser un héroe... —Su voz se quiebra al final, transformando la broma en algo más oscuro, más amargo—. Ahora lo es, joder.
		
		Nadie ríe.
		
		"

	elif  GameState.Hask <= 0:
		message_label.text += " 
		Droal yace cerca de las rocas, como si solo se hubiera echado a descansar, excepto por la flecha que aún sobresale de su garganta.
		
		Hask no tuvo tanta suerte.
		
		El bromista del grupo, el que siempre tenía una sonrisa afilada y un chiste listo, yace boca abajo, su cuchillo todavía clavado en las costillas del hombre que lo mató. Su rostro está vuelto hacia vosotros, la sonrisa congelada en una mueca de dolor, los dientes manchados de rojo. Parece que incluso en la muerte, sigue escupiendo su última burla al mundo.
		
		Goran es el primero en moverse. Se arrodilla junto a Hask con una pesadez y cuidado cierra los ojos de Hask. 
		
		Lyssa está quieta por primera vez en tu memoria. Se acerca a Goral, y sin mediar palabra, le apolla la mano en el hombro, sabiendo que el grandullo lo pasa mal cuando sus compañeros mueres.
		
		"
			

	message_label.text += "
	Tus ojos siguen al Silencioso mientras se agacha junto al cadáver de uno de los atacantes. Lo ves deslizar una mano bajo la capa del muerto, sus dedos largos y pálidos buscando algo entre los pliegues de la tela. Retira la mano y rapidamente introduce su mano en su bolsillo.
	
	Cuando se incorpora, sus ojos se encuentran con los tuyos. No hay sorpresa en ellos. No hay culpa. Sus ojos grises te mantienen la mirada un instante demasiado largo, desafiando cualquier pregunta.
	
	Luego empieza a acercarse al resto del grupo.
	
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
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-12.tscn")

func _on_opcion_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-13.tscn")
