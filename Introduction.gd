extends Control

@onready var name_input = $VBoxContainer/LineEdit
@onready var message_label = $VBoxContainer/MessageLabel
@onready var message_label2 = $VBoxContainer/MessageLabel2
@onready var continuar_button = $VBoxContainer/Continuar
@onready var button_fuerte = $VBoxContainer/Button_fuerte
@onready var button_inteligente = $VBoxContainer/Button_inteligente
@onready var button_carisma = $VBoxContainer/Button_carisma

var paso = 0
var ya_mostro_advertencia = false


func _ready():
    _ocultar_botones_atributos()

func _on_continuar_pressed():
    var player_name = name_input.text.strip_edges()

    match paso:
        0:
            if player_name == "":
                var advertencia = "Por favor, introduce un nombre válido."
                if not ya_mostro_advertencia:
                    message_label.text += "\n\n" + advertencia
                    ya_mostro_advertencia = true
                return
            else:
                GameState.player_name = player_name
                name_input.visible = false
                message_label.text = "%s... me apiado de tu alma por haber llegado a estas tierras, pero dime... ¿qué clase de persona eres?" % player_name
                continuar_button.visible = false
                _mostrar_botones_atributos()
                paso = 1  # avanzamos de verdad aquí
        1:
            continuar_button.visible = false  # Esperamos a que elija atributo
        2:
            # Cambia aquí a la siguiente escena
            get_tree().change_scene_to_file("res://Escenas/Capitulo-1-1.tscn")        

func _ocultar_botones_atributos():
    button_fuerte.visible = false
    button_inteligente.visible = false
    button_carisma.visible = false

func _mostrar_botones_atributos():
    button_fuerte.visible = true
    button_inteligente.visible = true
    button_carisma.visible = true

func _on_button_fuerte_pressed() -> void:
    GameState.fuerza += 5
    message_label.text = "Así que eres una persona fuerte. Confías en tus músculos, agilidad y resistencia para salir de aprietos. Además, pocos se atreven a cruzarse en tu camino cuando estás decidido. Tu cuerpo es tu mejor arma, y lo sabes."
    _ocultar_botones_atributos()
    continuar_button.visible = true
    message_label2.visible = true
    paso = 2

func _on_button_inteligente_pressed() -> void:
    GameState.inteligencia += 5
    message_label.text = "Así que prefieres usar la cabeza. La lógica, la observación y el conocimiento son tus aliados. Además, en un mundo caótico, tú ves patrones donde otros solo ven confusión. Las palabras y los planes bien trazados son más letales que cualquier espada."
    _ocultar_botones_atributos()
    continuar_button.visible = true
    message_label2.visible = true
    paso = 2


func _on_button_carisma_pressed() -> void:
    GameState.carisma += 5
    message_label.text = "Así que te apoyas en tu carisma. Tu lengua es tan afilada como cualquier hoja, y tu presencia en una sala nunca pasa desapercibida. Además, sabes leer a las personas, girar voluntades, y encender corazones o sembrar dudas con apenas una frase."
    _ocultar_botones_atributos()
    continuar_button.visible = true
    message_label2.visible = true
    paso = 2
