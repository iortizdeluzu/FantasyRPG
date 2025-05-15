extends Control


@onready var boton_continuar = $"CenterContainer/VBoxContainer/Continuar Partida"

func _ready():
	comprobar_actualizaciones()
	if FileAccess.file_exists("user://savegame.json"):
		boton_continuar.visible = true
	else:
		boton_continuar.visible = false



func _on_continuar_partida_pressed() -> void:
	var save_file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if save_file:
		var save_text = save_file.get_as_text()
		save_file.close()
		var save_data = JSON.parse_string(save_text)
		if typeof(save_data) == TYPE_DICTIONARY and save_data.has("capitulo"):
			GameState.capitulo_actual = save_data["capitulo"]
			_ir_a_capitulo(GameState.capitulo_actual)
		else:
			print("El archivo de guardado está corrupto o incompleto.")
	else:
			print("No se pudo abrir el archivo de guardado.")
	

func _ir_a_capitulo(capitulo):
	#match capitulo:
	#    "1.1":
	#        get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-1.tscn")
	#    "1.2":
	#        get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-2.tscn")
	#    "1.3":
	#        get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-3.tscn")
	#    "1.4":
	#        get_tree().change_scene_to_file("res://Escenas/Capitulo1/Capitulo-1-4.tscn")
	#    _:
	#        print("Capítulo no reconocido:", capitulo)
	var capitulo_archivo = capitulo.replace(".", "-")
	var ruta = "res://Escenas/Capitulo" + capitulo[0] + "/Capitulo-" + capitulo_archivo + ".tscn"
	if ResourceLoader.exists(ruta):
		get_tree().change_scene_to_file(ruta)
	else:
		print("Escena no encontrada:", ruta)

func comprobar_actualizaciones():
	var http = $HTTPRequestActualizador
	http.request_completed.connect(_on_request_completed)
	
	var url = "https://raw.githubusercontent.com/iortizdeluzu/FantasyRPG/main/latest_version.txt"  # Cambia por tu URL real
	var err = http.request(url)
	if err != OK:
		print("Error al enviar la solicitud HTTP:", err)

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200:
		print("Error al comprobar la versión. Código HTTP:", response_code)
		return

	var version_remota = body.get_string_from_utf8().strip_edges()
	var version_local = GameState.VERSION

	if version_remota != version_local:
		print("Hay una nueva versión disponible:", version_remota)
		mostrar_popup_actualizacion(version_remota)
	else:
		print("El juego está actualizado.")
		
func mostrar_popup_actualizacion(version_remota: String) -> void:
	var popup = ConfirmationDialog.new()
	popup.dialog_text = "Hay una nueva versión disponible: " + version_remota + ". ¿Deseas descargarla?"
	popup.confirmed.connect(func():
		OS.shell_open("https://drive.google.com/file/d/1ac6BdGmiz3xSe6RRyIA6OU34wBu4sn-4/view?usp=sharing")
	)
	add_child(popup)
	popup.popup_centered()
