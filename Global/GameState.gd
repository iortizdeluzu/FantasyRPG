# Global/GameState.gd
extends Node

const VERSION = "1.0.11"
const VERSION_URL = "https://github.com/iortizdeluzu/FantasyRPG/blob/main/latest_version.txt"
const DOWNLOAD_URL = "https://github.com/iortizdeluzu/FantasyRPG/blob/main/FantasyRPGTextGame.apk"

var player_name: String = ""
var genero: String = ""
var fuerza = 0
var inteligencia = 0
var carisma = 0
var capitulo_actual: String = ""


#Capitulo 1 - Variables 
var Droal = 1
var Hask = 1
var Silencioso = 1
var Goral = 1
var Lyssa = 1








# Guarda el estado actual como un diccionario JSON
func save_game():
	var save_data = {
		"player_name": player_name,
		"fuerza": fuerza,
		"inteligencia": inteligencia,
		"carisma": carisma,
		"capitulo_actual": capitulo_actual,
		"genero": genero,
		"Droal": Droal,
		"Hask": Hask,
		"Goral": Goral,
		"Silencioso": Silencioso,
		"Lyssa": Lyssa

	}

	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("✅ Partida guardada correctamente.")
	else:
		print("❌ Error al guardar la partida.")

# Carga los datos desde disco
func load_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if file:
		var save_text = file.get_as_text()
		file.close()
		var save_data = JSON.parse_string(save_text)
		if typeof(save_data) == TYPE_DICTIONARY:
			player_name = save_data.get("player_name", "")
			fuerza = save_data.get("fuerza", 0)
			inteligencia = save_data.get("inteligencia", 0)
			carisma = save_data.get("carisma", 0)
			capitulo_actual = save_data.get("capitulo_actual", "")
			genero = save_data.get("genero", "")
			Droal = save_data.get("Droal", 1)
			Hask = save_data.get("Hask", 1)
			Goral = save_data.get("Goral", 1)
			Silencioso = save_data.get("Silencioso", 1)
			Lyssa = save_data.get("Lyss", 1)

			print("✅ Partida cargada correctamente.")
		else:
			print("❌ Archivo de guardado corrupto.")
	else:
		print("ℹ️ No se encontró archivo de guardado.")
