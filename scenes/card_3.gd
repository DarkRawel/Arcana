extends Node2D

signal hovered
signal hovered_off

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect_card_signals(self) # vola na rodica co je cardmanager

func _on_area_2d_mouse_entered() -> void: # ked sa mys dotkne area2d tak posle signale
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void: # ked sa mys odide z area2d tak posle signale
	emit_signal("hovered_off", self)
