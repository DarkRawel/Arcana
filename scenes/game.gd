extends Node2D

var screen_size
var card_base_position = [Vector2(475, 525), Vector2(580, 525)]

var CardScene = preload("res://scenes/card.tscn") #Nahrá scénu karty
var CardDatas = [preload("res://Data/alex.tres"), #Loaduje dáta kariet
preload("res://Data/Potion.tres"),
preload("res://Data/Axe.tres")]
var RandomCardDatas := []

func randomize_cards(): #nahodné karty
	for i in range(2): #dve karty
		var rng = randi_range(0, CardDatas.size()-1) #nahodna hodnota
		RandomCardDatas.append(CardDatas[rng])
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize_cards()
	screen_size = get_viewport_rect().size
	for card in card_base_position.size(): #pripravuje pociet kariet podla volných pozícií
		var cardexistance = CardScene.instantiate() #vytovorí instaciu karty
		cardexistance.data = RandomCardDatas[card]
		add_child(cardexistance) #spravý kópiu karty
		cardexistance.global_position = card_base_position[card] #zadá pozíciu karte
		cardexistance.original_pos = cardexistance.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
