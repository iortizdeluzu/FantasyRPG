extends Control


@onready var boton_continuar = $"CenterContainer/VBoxContainer/Continuar Partida"

func _ready():
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
    match capitulo:
        "1.1":
            get_tree().change_scene_to_file("res://Escenas/Capitulo-1-1.tscn")
        "1.2":
            get_tree().change_scene_to_file("res://Escenas/Capitulo_1_2.tscn")
        "2.1":
            get_tree().change_scene_to_file("res://Escenas/Capitulo_2_1.tscn")
        _:
            print("Capítulo no reconocido:", capitulo)
