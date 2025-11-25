extends Control
var URLS = ["https://github.com/MadfixIsMe", "https://github.com/DarkRawel"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")


func _on_link_button_pressed() -> void:
	for url in URLS:
		OS.shell_open(url)
