@tool
extends VBoxContainer


@export var count_x = 11
@export var count_y = 5
@export var Music_note:PackedScene
var Toggled_buttons = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Notes = ["A","A#","B","C","C#","D#","E","F","F#","G","A♭","A"]
	
	var button_size_x:int = floor((get_parent_area_size()[0])/(count_x+0.5))
	var button_size_y:int = floor((get_parent_area_size()[1])/(count_y+0.5))
	
	for y in range(count_y):
		var hgrid = HBoxContainer.new()
		
		for x in range(count_x):
			var new_rec:Button = Music_note.instantiate()
			
			new_rec.custom_minimum_size = Vector2(button_size_x,button_size_y)
			
			new_rec.text = Notes[x] + "\n" + str(round(110 *  pow(2,y) * pow(2, x / 12.0) * 100) / 100)
			hgrid.add_child(new_rec)
		
		add_child(hgrid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
