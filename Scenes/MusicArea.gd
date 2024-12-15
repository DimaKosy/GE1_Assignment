extends Container

@export var MusicScene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var Init_scene:VBoxContainer = MusicScene.instantiate()
	
	
	Init_scene.custom_minimum_size = self.custom_minimum_size
	print(Init_scene.custom_minimum_size)
	
	
	add_child(Init_scene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
