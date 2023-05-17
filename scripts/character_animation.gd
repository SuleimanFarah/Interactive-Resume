extends CharacterBody2D

const speed = 50
@onready var anim_player = $CharacterMovement
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
func _ready():
	animation_tree.set("parameters/Idle/blend_position", Vector2(0,1))
	
func _physics_process(delta):
	var inputdir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	update_animtree_param(inputdir)
	velocity = inputdir * speed
	move_and_slide()
	new_state()

func update_animtree_param(moveinput: Vector2):
	if (moveinput != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", moveinput)
		animation_tree.set("parameters/Idle/blend_position", moveinput)


func new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
