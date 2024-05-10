extends CharacterBody2D

var destination = Vector2()
var gap = Vector2()

const SPEED = 64

func _input(_event):
	if get_parent().playing:
		if Input.is_action_just_pressed("ui_right"):
			velocity = Vector2.RIGHT
			$AnimatedSprite2D.play("right")
		if Input.is_action_just_pressed("ui_left"):
			velocity = Vector2.LEFT
			$AnimatedSprite2D.play("left")
		if Input.is_action_just_pressed("ui_up"):
			velocity = Vector2.UP
			$AnimatedSprite2D.play("up")
		if Input.is_action_just_pressed("ui_down"):
			velocity = Vector2.DOWN
			$AnimatedSprite2D.play("down")
		if Input.is_action_just_released("ui_right"):
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("right_calm")
		if Input.is_action_just_released("ui_left"):
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("left_calm")
		if Input.is_action_just_released("ui_up"):
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("up_calm")
		if Input.is_action_just_released("ui_down"):
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("down_calm")

func _process(delta):
	var collision = move_and_collide(velocity * SPEED * delta)
	if collision:
		var node = collision.get_collider()
		if node is CharacterBody2D:
			node.push(velocity * SPEED)
