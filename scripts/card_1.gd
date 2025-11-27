extends Node2D

signal hovered
signal hovered_off

@export var data: CardData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect_card_signals(self) # vola na rodica co je cardmanager
	if data:
		apply_data()
		
func apply_data():
	$NameLabel.text = data.name
	$CostLabel.text = str(data.cost)
	$DamageLabel.text = str(data.damage)
	$Description.text = str(data.description)
	$Sprite2D.texture = data.art
	

func _on_area_2d_mouse_entered() -> void: # ked sa myska dotkne area2d tak posle signale
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void: # ked sa myska odide z area2d tak posle signale
	emit_signal("hovered_off", self)
