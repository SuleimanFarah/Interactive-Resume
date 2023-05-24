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
	var url = "https://www.dropbox.com/s/tvp30dkg65wrvtt/Suleiman%20Farah%20Resume.pdf?dl=0"
	OS.shell_open(url)

func _on_timer_timeout():
	rect.visible = not rect.visible;
	animation.play("Air Condition")


func _on_gmail_button_pressed():
	OS.shell_open("mailto:farah.suly@gmail.com")


func _on_linkedin_button_pressed():
	var url = "https://www.linkedin.com/in/suleiman-farah-a0633a253/"
	OS.shell_open(url)


func _on_git_hub_button_pressed():
	var url = "https://github.com/SuleimanFarah"
	OS.shell_open(url)
