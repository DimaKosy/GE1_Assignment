extends Button

var frequency = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect("released", Callable(self, "_on_button_released"))
	#connect("pressed", Callable(self, "_on_button_pressed"))
	pass

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Pressed")
				#text = "PRESSED"
				get_tree().root.get_child(0).play_tones([frequency], 1)
			else:
				print("Released")
				#text = "Released"
