extends Node2D
var music;
var animation;
var cat;
# Called when the node enters the scene tree for the first time.
func _ready():
	animation = $AnimationPlayer;
	cat = $CatAnimator;
	cat.play("Cat Animation")
	animation.play("Air Condition")
	music = get_node("AudioStreamPlayer")
	music.play()
	var http_request = $HTTPRequest
	http_request.connect("request_completed", self, "_on_request_completed")
	var file_path = "res://assets/Resume/Suleiman Farah Resume.pdf"

func _exit_tree():
	music.stop()

func downloadResume():
	var url = "https://example.com/path/to/resume.pdf"
	http_request.request(url)

func _on_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var file_path = "user://resume.pdf"
		var file = FileAccess.new()
		if file.open(file_path, File.WRITE) == OK:
			file.store_string(body)
			file.close()
			print("Resume downloaded successfully.")
		else:
			print("Failed to open download file for writing.")
	else:
		print("Failed to download resume. Response code: ", response_code)
