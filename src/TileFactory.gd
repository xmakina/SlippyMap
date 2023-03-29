extends Node

export (int) var image_size = 32

func generate_tile() -> ImageTexture:
	var image: Image = Image.new().create(image_size, image_size, false,Image.FORMAT_BPTC_RGBA)
	image.lock()
	image.fill(Color.aquamarine)
	image.unlock()
	var texture = ImageTexture.new().create_from_image(image)
	return texture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
