extends ColorRect

signal drag(event)
signal release(view)

func _gui_input(event):
	if event is InputEventScreenDrag: 
		emit_signal("drag",event)

	if event is InputEventScreenTouch and not event.is_pressed():
		emit_signal("release",self)
