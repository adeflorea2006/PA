extends TileMapLayer

var astar_grid = AStarGrid2D.new()

func _ready():
	# 1. Setup the grid size and movement rules
	astar_grid.region = get_used_rect()
	astar_grid.cell_size = tile_set.tile_size
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER # Force 4-way movement
	astar_grid.update() # Must call update() before adding walls
	
	# 2. Scan the map and mark tiles with collision layers as "Solid"
	for cell_coords in get_used_cells():
		var tile_data = get_cell_tile_data(cell_coords)
		if tile_data and tile_data.get_collision_polygons_count(0) > 0:
			astar_grid.set_point_solid(cell_coords, true)

# 3. Call this from your character to get the path
func get_path_for_character(start_pos: Vector2, target_pos: Vector2) -> PackedVector2Array:
	var start_grid = local_to_map(start_pos)
	var target_grid = local_to_map(target_pos)
	
	# Calculate the path
	var path_coords = astar_grid.get_id_path(start_grid, target_grid)
	
	# Convert grid coordinates back to world pixels
	var world_path = PackedVector2Array()
	for point in path_coords:
		world_path.append(map_to_local(point))
		
	return world_path


func _on_sign_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_sign_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
