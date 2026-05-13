extends Area2D

# Using @export lets you type a different fun fact in the Inspector for EVERY scroll!
@export_multiline var fun_fact: String = "Default fact!"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D:
		# Find the UI and send it the text
		var ui = get_tree().get_first_node_in_group("Popups")
		if ui:
			ui.open_scroll(fun_fact)
			
		queue_free() # Destroy the scroll on the ground
