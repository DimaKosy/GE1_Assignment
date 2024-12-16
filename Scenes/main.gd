extends Node2D

var sample_hz = 44100.0  # Sample rate
var playback: AudioStreamPlayback = null  # Actual playback stream, assigned in _ready()

var chunk_size = 1024  # Size of the chunks to push
var active_notes = []  # Store active frequencies (notes)

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	$AudioStreamPlayer.stream.mix_rate = sample_hz
	$AudioStreamPlayer.stream.buffer_length = 1.0
	$AudioStreamPlayer.play()
	playback = $AudioStreamPlayer.get_stream_playback()
	print($AudioStreamPlayer)

	# Play multiple notes at the same time
	#play_tones([110], 10)  # Frequencies for A4, C5, E5 for 5 seconds
	#$AudioStreamPlayer.stop()

# Function to play multiple tones simultaneously (polyphony)
func play_tones(frequencies: Array, duration: float):
	
	if($Container/VBoxContainer/HBoxContainer.active_button == $Container/VBoxContainer/HBoxContainer/Record):
		for b in $ScrollContainer/recorder_container.Toggled_buttons:
			var note = [frequencies, duration]
			
			b.active_notes.append(note)
			print(b.active_notes)
			pass
		pass
	
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

func play_saved():
	for b in $ScrollContainer/recorder_container.Toggled_buttons:
		b.playing = true
		pass
	pass
	
func playing(play:bool):
	for b in $ScrollContainer/recorder_container.Toggled_buttons:
		b.playing = play
		pass
	pass
	
func clear_active():
	for b in $ScrollContainer/recorder_container.Toggled_buttons:
		b.active_notes.clear()
		b.playing = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	pass
