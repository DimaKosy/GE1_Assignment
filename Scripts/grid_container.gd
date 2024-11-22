extends GridContainer

@export var button_scene:PackedScene
@export var Rows:int;
@export var Cols:int;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for c in range(Cols):
		for r in range(Rows):
			var button = button_scene.instantiate()
			button.position = Vector2(r*10,c*10)
			
			add_child(button)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
