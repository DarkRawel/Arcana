extends Node2D

var screen_size
var card_being_dragged: Node2D
<<<<<<< Updated upstream

func _ready() -> void:
	screen_size = get_viewport_rect().size
=======
var home_positions := {} #dictionary pre karty a ich pozície
var random = RandomNumberGenerator.new()
var bottom_positions = [Vector2(230, 555), Vector2(340, 555)]

func rand_cards_pick(count := 2): #kolko kariet chceme
	var cards = get_children()
	for child in get_children():
		if child.name.begins_with("Card"):
			cards.append(child)
	var selected_cards = []
	var cardnum = random.randi_range(0, 1) #podla mnostva kariet 2 hodnoty 0, 1
	
	random.randomize()
	
	for i in range(count):
		selected_cards.append(cards[cardnum])
		cards.remove_at(cardnum)
	return selected_cards

func deal_cards():
	var picked_cards = rand_cards_pick()
	for i in picked_cards.size():
		var card = picked_cards[i]
		card.visible = true
		card.position = bottom_positions[i]
		home_positions[card] = bottom_positions[i]
		

func _ready() -> void:
	screen_size = get_viewport_rect().size
	deal_cards()
>>>>>>> Stashed changes

func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x),
											  clamp(mouse_pos.y, 0, screen_size.y))

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = raycast_check_for_card()
			if card:
				card_being_dragged = card
		else:
<<<<<<< Updated upstream
=======
			if card_being_dragged != null and home_positions.has(card_being_dragged):  #vráti sa naspäť
				card_being_dragged.position = home_positions[card_being_dragged]
>>>>>>> Stashed changes
			card_being_dragged = null


func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var params := PhysicsPointQueryParameters2D.new()
	params.position = get_global_mouse_position()
	params.collide_with_areas = true   
	params.collision_mask = 1          

	var result = space_state.intersect_point(params)

	if result.size() > 0:
		var collider = result[0].collider
		var card = collider.get_parent()
		return card  

	return null
