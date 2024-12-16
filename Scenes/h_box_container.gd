extends HBoxContainer

var active_button:Button = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var child_size = size
	
	
	for c in get_children():
		print(child_size)
		c.custom_minimum_size = Vector2((child_size[0]-10)/get_child_count(), child_size[1])
		
	pass # Replace with function body.

func set_active_button(button: Button):
	if active_button and active_button != button:  # Unpress the previous button
		active_button.button_pressed = false
	active_button = button  # Reassign active_button (mutable globally)
	active_button.button_pressed = true  # Press the new button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
