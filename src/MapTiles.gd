extends TileMap

func change_position(movement: Vector2):
	self.position += movement

func to_row_col(position: Vector3) -> Vector3:
	var lat = position.y
	var lon = position.x
	var zoom = position.z
	var lat_rad = deg2rad(lat)
	var n = pow(2, zoom)
	var xtile = int((lon + 180.0) / 360.0 * n)
	var ytile = floor((1 - log(tan(deg2rad(lat)) + 1 / cos(deg2rad(lat))) / PI) /2 * n)
	return Vector3(xtile, ytile, zoom)
	
func to_lat_lon(position: Vector3) -> Vector3:
	var row = position.y
	var col = position.x
	var zoom = position.z
	
	var n = pow(2, zoom)
	var lon_deg = row / n * 360.0 - 180.0
	var lat_rad = atan(sinh(PI * (1 - 2 * col / n)))
	var lat_deg = rad2deg(lat_rad)
	return Vector3(lon_deg, lat_deg, zoom)

# Called when the node enters the scene tree for the first time.
func _ready():
	var latLon = to_lat_lon(Vector3(101506, 223587, 18))
	var tiles = to_row_col(latLon)
	
	print(latLon)
	print(tiles)
	
	var rows = [223586,223587,223588]
	var columns = [101505,101506,101507,101508]
	var zoom = 18
	
	self.clear()
	
	var tileSet = TileSet.new()
	print(tileSet.get_tiles_ids())
	
	for row in rows:
		for column in columns:
			var id = tileSet.get_last_unused_tile_id()
			var name = "lat%d-lon%d" % [row, column]
			tileSet.create_tile(id)
			var imageTextureLocation = "res://test/%d/%d/%d.png"
			var imageTexture = ImageTexture.new()
			imageTexture.load(imageTextureLocation % [zoom, row, column])
			tileSet.tile_set_texture(id, imageTexture)
			tileSet.tile_set_region(id, Rect2(0,0,256,256))
			tileSet.tile_set_name(id, name)
	
	self.tile_set = tileSet
	
	var length = abs(223586-223588)
	var height = abs(101505-101508)
	
	for rowIndex in length + 1:
		for colIndex in height + 1:
			var name = "lat%d-lon%d" % [rows[rowIndex], columns[colIndex]]
			
			self.set_cell(rowIndex, colIndex, tileSet.find_tile_by_name(name))
			pass
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
