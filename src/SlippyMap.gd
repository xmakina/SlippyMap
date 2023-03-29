extends Node2D

func change_position(vector: Vector2):
	$MapTiles.change_position(vector)

func load_tiles():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	load_tiles()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
