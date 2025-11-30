extends Button
#VYSVETLIVKY FARIEB:
#Main Color - 191009
#Popupbtn Color - 241910
#Popupbtn Color_hover - 35261a
#Shadow Color - bababafc
@onready var CONTAINER = $VBoxContainer #ukladá vboxcontainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if CONTAINER.visible:
		CONTAINER.visible = false
	else:
		CONTAINER.visible = true


func _on_back_to_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
