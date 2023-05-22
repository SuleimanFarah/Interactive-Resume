extends Node2D
var music;
var animation;
var cat;
var rect;
# Called when the node enters the scene tree for the first time.
func _ready():
	rect = $Pixel;
	
	var planetPlayer = $"Planet Animator"
	planetPlayer.play("Spin")
	animation = $AnimationPlayer;
	cat = $CatAnimator;
	cat.play("Cat Animation")
	animation.play("Pixel")
	
	music = get_node("AudioStreamPlayer")
	music.play()



func _exit_tree():
	music.stop()

func _on_button_pressed():
	print("pressed!")
	var url = "https://www.dropbox.com/s/6jmvcuv0h980n00/Suleiman%20Farah%20Resume.pdf?dl=0"
	OS.shell_open(url)



func _on_timer_timeout():
	rect.visible = not rect.visible;
	animation.play("Air Condition")
