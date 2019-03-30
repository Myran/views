extends Node

var deadzone = 150

func _on_Play_pressed(num):
	num = min($VBoxContainer/HBoxContainer.get_child_count()-1, num)
	$Camera2D.position = Vector2()
	for i in range(num, 0, -1):
		$Camera2D.position.x += $VBoxContainer/HBoxContainer.get_child(i).rect_size.x


func _on_View_drag(event):
	$Camera2D.offset.x -= event.relative.x


func _on_View_release(view):
	var dir
	if abs($Camera2D.offset.x) < deadzone:
		dir = 0
	elif $Camera2D.offset.x < deadzone:
		dir= -1
	elif $Camera2D.offset.x > deadzone:
		dir = 1
	
	_on_Play_pressed(view.get_index()+dir)
	$Camera2D.offset = Vector2()

