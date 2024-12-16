extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.button_pressed:
		get_tree().root.get_child(0).play_saved()
		print("Play")
	pass

func _pressed() -> void:
	get_parent().set_active_button(self)
