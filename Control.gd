extends Control

var current_node = "start"
var story = {
	"start": {
		"text": "You wake up in a forest clearing. What do you do?",
		"choices": ["Look around", "Rest"],
		"next": ["look", "rest"]
	},
	"look": {
		"text": "You find a sword lying on the ground.",
		"choices": ["Take it", "Leave it"],
		"next": ["take_sword", "leave_sword"]
	}
}

func _ready():
	load_node("start")

func load_node(node_id):
	current_node = node_id
	var node = story[node_id]
	$Label.text = node["text"]
	$Button1.text = node["choices"][0]
	$Button2.text = node["choices"][1]

func _on_Button1_pressed():
	load_node(story[current_node]["next"][0])

func _on_Button2_pressed():
	load_node(story[current_node]["next"][1])
