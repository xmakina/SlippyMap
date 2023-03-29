extends Control

var pressed = false
var mouse_inside = false

func _input(event):
	if not mouse_inside:
		return
	if event is InputEventMouseButton:
		if Input.is_action_pressed("left_mouse"):
			pressed = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if Input.is_action_just_released("left_mouse"):
			pressed = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event is InputEventMouseMotion:
		if pressed:
			$SlippyMap.change_position(event.relative)
			pass
		pass
	pass

func _on_SlippyMapWrapper_mouse_entered():
	mouse_inside = true
	pass # Replace with function body.


func _on_SlippyMapWrapper_mouse_exited():
	mouse_inside = false
	pass # Replace with function body.
