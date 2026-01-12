extends CharacterBody2D
var Current_Dir = "none"

const speed = 100
var input: Vector2

func _physics_process(delta):
	velocity = player_input()*speed
	move_and_slide()

func player_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

	
func animation(motion):
	var d = Current_Dir
	var head = $Head 
	var body = $Body
	var hands = $Hands
	
	if d == "Right":
		head.flip_h = false
		body.flip_h = false
		hands.flip_h = false
		
		if motion == 1:
			head.play("Side_Idle")
			body.play("Side_Idle")
			hands.play("Side_Idle")

	if d == "Left":
		head.flip_h = true
		body.flip_h = true
		hands.flip_h = true
		
		if motion == 1:
			head.play("Side_Idle")
			body.play("Side_Idle")
			hands.play("Side_Idle")

	if d == "Up" && motion == 1:
		head.play("Back_Idle")
		body.play("Back_Idle")
		hands.play("Back_Idle")

	if d == "Down" && motion == 1:
		head.play("Front_Idle")
		body.play("Front_Idle")
		hands.play("Front_Idle")
