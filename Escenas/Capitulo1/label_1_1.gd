extends Label

func _ready():
	$ScrollContainer/unouno.text = "Capítulo: " + str(GameState.capitulo_actual)
