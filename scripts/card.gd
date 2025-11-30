class_name Card
extends Node2D

signal hovered
signal hovered_off
var dragging := false
var original_pos:= Vector2.ZERO
@export var data: CardData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data:
		apply_data()
		
func apply_data(): #zadáva hodnoty z tres files.
	$CardName.text = data.name
	$CardCost.text = str(data.cost)
	$CardDmg.text = str(data.damage)
	$CardDesc.text = data.description
	$CardTexture.texture = data.art
	$CardTexture.expand = true
	
func _process(delta: float) -> void: #pohyb karty.
	if dragging:
		global_position = get_global_mouse_position()

func _on_area_2d_mouse_entered() -> void: # treba opraviť
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void: # treba opraviť
	emit_signal("hovered_off", self)


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: #pohyb karty
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
		else:
			dragging = false
			global_position = original_pos
