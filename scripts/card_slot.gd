extends Node2D

var card_in_slot = false
var card_inside: Node

func _on_area_CardSlot_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: #pridáva kartu do slotu pokial tam nejaká nieje
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed == false:
			if card_in_slot == false:
				place_card(card_inside)


func _on_area_CardSlot_area_entered(area: Area2D) -> void: #pozerá či je karta v slot
	var parent = area.get_parent()
	if parent is Card:
		card_inside = parent

func place_card(card): #pokladanie karty.
	card.dragging = false
	card.global_position = global_position
	card.original_pos = card.global_position
	card_in_slot = true
