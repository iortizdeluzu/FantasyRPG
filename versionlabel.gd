extends Label

func _ready():
    var version = ProjectSettings.get_setting("application/config/version")
    $versionlabel.txt = "Versión: " + version
