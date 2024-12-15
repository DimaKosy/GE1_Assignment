extends VBoxContainer


@export var count_x = 7
@export var count_y = 20
@export var recorder:PackedScene
@export var recorder_theme:Theme



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	var button_size:int = floor((get_parent_area_size()[0])/(count_x+0.5))
	
	for y in range(count_y):
		var hgrid = HBoxContainer.new()
		
		for x in range(count_x):
			var new_rec:Button = recorder.instantiate()
			
			new_rec.theme = recorder_theme.duplicate()
			
			
			new_rec.custom_minimum_size = Vector2(button_size,button_size)
			hgrid.add_child(new_rec)
		
		add_child(hgrid)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
