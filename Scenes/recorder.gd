extends Button

@export var Style_saved:StyleBoxTexture
@export var Style_unsaved:StyleBoxTexture
@export var Saved_state:bool = false
var button_list:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.theme.set_stylebox("normal", "Button", Style_unsaved)  # Modify the theme
	self.theme.set_stylebox("hover", "Button", Style_unsaved)  # Modify the theme
	
	button_list = get_parent().get_parent().Toggled_buttons	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		Saved_state = !Saved_state
		button_list.append(self)
	else:
		button_list.erase(self)
		
	print(button_list)
	pass

func _pressed() -> void:
	if(Saved_state):
		self.theme.set_stylebox("normal", "Button", Style_unsaved)
		self.theme.set_stylebox("hover", "Button", Style_unsaved) 
	else:
		self.theme.set_stylebox("normal", "Button", Style_saved)
		self.theme.set_stylebox("hover", "Button", Style_saved)  
	pass
