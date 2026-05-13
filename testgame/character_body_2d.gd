extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var tilemap: TileMapLayer
@export var line: Line2D
var speed = 100.0

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	
	# Check horizontal first
	if Input.is_action_pressed("ui_left"):
		input_dir.x = -1
	elif Input.is_action_pressed("ui_right"):
		input_dir.x = 1
	# Only allow vertical if horizontal is NOT being pressed
	elif Input.is_action_pressed("ui_up"):
		input_dir.y = -1
	elif Input.is_action_pressed("ui_down"):
		input_dir.y = 1
		
	velocity = input_dir * speed
	
	move_and_slide()
	update_animation()

func update_animation():
	if velocity.length() == 0:
		anim.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				anim.play("walk_right")
			else:
				anim.play("walk_left")
		else:
			if velocity.y > 0:
				anim.play("walk_down")
			else:
				anim.play("walk_up")

# Add this function to listen for mouse clicks
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		
		# Ask the TileMap for the path
		var path = tilemap.get_path_for_character(global_position, mouse_pos)
		
		# Give the coordinates to the Line2D to draw
		line.points = path
