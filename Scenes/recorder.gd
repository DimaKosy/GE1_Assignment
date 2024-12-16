extends Button

@export var Style_saved:StyleBoxTexture
@export var Style_unsaved:StyleBoxTexture
@export var Saved_state:bool = false
var button_list:Array
var timer:Timer
var playing:bool = false


var sample_hz = 44100.0  # Sample rate
var playback: AudioStreamPlayback = null  # Actual playback stream, assigned in _ready()

var chunk_size = 1024  # Size of the chunks to push
var active_notes = []  # Store active frequencies (notes)

#var thread = Thread.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = Timer.new()
	add_child(timer)  # Add the timer to the scene tree
	
	$AudioStreamPlayer.stream.mix_rate = sample_hz
	$AudioStreamPlayer.stream.buffer_length = 0.5
	$AudioStreamPlayer.play()
	playback = $AudioStreamPlayer.get_stream_playback()
	print($AudioStreamPlayer)
	
	
	self.theme.set_stylebox("normal", "Button", Style_unsaved)  # Modify the theme
	self.theme.set_stylebox("hover", "Button", Style_unsaved)  # Modify the theme
	
	button_list = get_parent().get_parent().Toggled_buttons	
	pass # Replace with function body.


func play(delta):
	print("Playing:")
	print(active_notes)
	for a in active_notes:
		$AudioStreamPlayer.play()
		print(a[0])
		playback = $AudioStreamPlayer.get_stream_playback()
		#thread.start(play_tones.bind(a[0],a[1]*70))
		#thread.wait_to_finish()
		play_tones(a[0],a[1] * delta)
		
		#OS.delay_msec(a[1]*1000)
		$AudioStreamPlayer.stop()
	#timer.queue_free()
		
	pass

func play_tones(frequencies: Array, duration: float):	
	var samples = int(sample_hz * duration)

	for start in range(0, samples, chunk_size):
		var chunk = PackedVector2Array()
		var mixed_samples = Vector2()  # For mixing the stereo data of all notes
		
		# Sum the waveforms of all active notes
		for i in range(chunk_size):
			var sample_left = 0.0
			var sample_right = 0.0
			for frequency in frequencies:
				var time = (start + i) / sample_hz
				var sample = 0.5 * sin(2.0 * PI * frequency * time)  # Volume control
				sample_left += sample
				sample_right += sample

			# Clip or normalize the values if needed
			mixed_samples.x = sample_left
			mixed_samples.y = sample_right
			chunk.append(mixed_samples)  # Add the mixed stereo sample to the chunk

		if chunk.size() > 0:
			playback.push_buffer(chunk)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if playing:
		play(delta)
		
	
	pass
	
func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		button_list.append(self)
	else:
		button_list.erase(self)
		playing = false
	
	if(!active_notes.is_empty()):
		self.theme.set_stylebox("normal", "Button", Style_saved)
		self.theme.set_stylebox("hover", "Button", Style_saved) 
	else:
		self.theme.set_stylebox("normal", "Button", Style_unsaved)
		self.theme.set_stylebox("hover", "Button", Style_unsaved) 
		 
	pass

func _pressed() -> void:
	
	pass
	
