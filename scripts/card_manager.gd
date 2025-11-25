extends Node2D

var screen_size
var card_being_dragged: Node2D
var home_positions := {} #dictionary pre karty a ich pozície
var card_base_position = [Vector2(475, 525), Vector2(580, 525)]
var random = RandomNumberGenerator.new()

func random_card(count := 2): # kolko kariet = count
	random.randomize()
	var cards := []
	var random_cards := []
	
	for card in get_children(): #nahrá všetky karty.
		if card.name.begins_with("Card"):
			cards.append(card)
			
	cards.shuffle() #zamieša list
	
	for a in range(count): #vyberie prvé 2.
		random_cards.append(cards[a])
		
	for b in range(random_cards.size()): #zviditelní karty a nastaví ich pozíciu
		var card = random_cards[b]
		card.visible = true
		card.position = card_base_position[b]
		home_positions[card] = card_base_position[b]
	
	return random_cards
	


func _ready() -> void:
	screen_size = get_viewport_rect().size
	random_card()


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
			if card_being_dragged != null:  #vráti sa naspäť
				card_being_dragged.position = home_positions[card_being_dragged]
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
