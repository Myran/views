extends Node

var deadzone = 150

func _on_Play_pressed(view_idx):
	
	$Camera2D.smoothing_enabled = false
	$Camera2D.position += $Camera2D.offset
	
	
	$Camera2D.position = Vector2()
	
	
	view_idx = min($VBoxContainer/HBoxContainer.get_child_count()-1, view_idx)
	for i in range(view_idx, 0, -1):
		$Camera2D.position.x += $VBoxContainer/HBoxContainer.get_child(i).rect_size.x
	$Camera2D.offset = Vector2()
	$Camera2D.smoothing_enabled = true

func _on_View_drag(event):
	$Camera2D.offset.x -= event.relative.x


func _on_View_release(view):
	
	if $Camera2D.offset.x < -deadzone:
		_on_Play_pressed(view.get_index()-1)
	elif $Camera2D.offset.x > deadzone:
		_on_Play_pressed(view.get_index()+1)
	else:
		_on_Play_pressed(view.get_index())
	
	

