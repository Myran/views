extends Node

var deadzone = 150
var currentPosX = 0
func _on_Play_pressed(view_idx):
	$Camera2D.position = Vector2()
	view_idx = min($VBoxContainer/HBoxContainer.get_child_count()-1, view_idx)
	for i in range(view_idx, 0, -1):
		$Camera2D.position.x += $VBoxContainer/HBoxContainer.get_child(i).rect_size.x
		
	currentPosX = $Camera2D.position.x
	
func _on_View_drag(event):
	$Camera2D.position.x -= event.relative.x

func _on_View_release(view):
	if $Camera2D.position.x-currentPosX < - deadzone:
		_on_Play_pressed(view.get_index()-1)
	elif $Camera2D.position.x-currentPosX > deadzone:
		_on_Play_pressed(view.get_index()+1)
	else:
		_on_Play_pressed(view.get_index())
	
	

