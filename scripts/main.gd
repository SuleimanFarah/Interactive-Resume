extends Control


var animation_player
var music
var timer
var rect

func _exit_tree():
	music.stop()

func _ready():
	rect = $ColorRect;
	rect.visible = not rect.visible;
	music = get_node("AudioStreamPlayer")
	animation_player = $AnimationPlayer
	music.play()
	animation_player.play("Blink")
	timer = get_node("Timer")
	timer.one_shot = true
	timer.wait_time = 0.8

func _input(event):
	if event is InputEventKey and Input.is_action_pressed("enter_key"):
		rect.visible = not rect.visible;
		animation_player.play("Pixel")	
		timer.start()

func _on_timer_timeout():
	rect.visible = not rect.visible;
	get_tree().change_scene_to_file("res://scenes/world.tscn")
