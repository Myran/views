extends ColorRect

signal drag(event)
signal release(view)

func _ready():
	_on_TabButton_pressed(0)
	
func _gui_input(event):
	if event is InputEventScreenDrag: 
		emit_signal("drag",event)

	if event is InputEventScreenTouch and not event.is_pressed():
		emit_signal("release",self)


func _on_TabButton_pressed(tab_idx):
	for tab in $tabs.get_children():
		tab.tabButton.pressed = false
		tab.panel.visible = false
		
	$tabs.get_child(tab_idx).panel.visible = true
	$tabs.get_child(tab_idx).tabButton.pressed = true

