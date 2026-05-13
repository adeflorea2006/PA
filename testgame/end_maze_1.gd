extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D: 
		print("Tomato Collected! Changing scenes...")
		
		# Paste your copied path inside the quotes below!
		get_tree().change_scene_to_file("res://lvl_2.tscn")
