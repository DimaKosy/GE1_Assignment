@tool
extends VBoxContainer


@export var count_x = 11
@export var count_y = 4
@export var Music_note:PackedScene
var root:Node2D
var Toggled = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_tree().root.get_child(0)
	var Notes = ["A","A#","B","C","C#","D#","E","F","F#","G","A♭","A"]
	
	#set button sizes to fit
	var button_size_x:int = floor((get_parent_area_size()[0])/(count_x+0.5))
	var button_size_y:int = floor((get_parent_area_size()[1])/(count_y+1.5))
	
	#silent note space
	var hgrid = HBoxContainer.new()
	var new_rec:Button = Music_note.instantiate()
	
	new_rec.custom_minimum_size = Vector2(get_parent_area_size()[0],button_size_y)
	new_rec.frequency = 0
	new_rec.text = "0f spacer" #text
	hgrid.add_child(new_rec)
	add_child(hgrid)
	
	# add notes to box
	for y in range(count_y):
		hgrid = HBoxContainer.new()
		
		for x in range(count_x):
			new_rec = Music_note.instantiate()
			
			new_rec.custom_minimum_size = Vector2(button_size_x,button_size_y)
			new_rec.frequency = round(110 *  pow(2,y) * pow(2, x / 12.0) * 100) / 100
			
			new_rec.text = Notes[x] + "\n" + str(new_rec.frequency)
			hgrid.add_child(new_rec)
		
		add_child(hgrid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
