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
	#checks to see if active button is the button
	if active_button == button:
		if active_button == $Play:
			get_tree().root.get_child(0).playing(active_button.button_pressed)
			print("Play")
		return
	
	if active_button:  # Unpress the previous button
		active_button.button_pressed = false
	
	active_button = button  # Reassign active_button (mutable globally)
	if active_button == $Clear:
		print("Cleared")
		return
	if active_button == $Record:
		get_tree().root.get_child(0).playing(false)
		
	active_button.button_pressed = true  # Press the new button

func clear_active_button():
	if active_button == null:
		return
	active_button.button_pressed = false
	active_button = null



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
