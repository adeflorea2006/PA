extends CanvasLayer

@onready var label = $Panel/Label
@onready var button = $Panel/Button

func _ready():
	hide() # Hide it when the game starts
	add_to_group("Popups") # Makes it easy for scrolls to find
	button.pressed.connect(_on_close_pressed)

func open_scroll(fact_text: String):
	label.text = fact_text
	show()
	get_tree().paused = true # Freezes the game

func _on_close_pressed():
	hide()
	get_tree().paused = false # Unfreezes the game
