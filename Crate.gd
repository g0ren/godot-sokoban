extends CharacterBody2D

const SPEED = 64

func push(distance):
	move_and_collide(distance)
	
func _process(_delta):
	position.x = floor(position.x / SPEED) * SPEED
	position.y = floor(position.y / SPEED) * SPEED
	if position in get_parent().targets:
		$Sprite2D.texture = load("res://assets/environment/crate_x.png")
	else:
		$Sprite2D.texture = load("res://assets/environment/crate.png")
