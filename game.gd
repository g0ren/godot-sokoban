extends Node2D

const SPEED = 64
var targets = Array()
var playing = true
# Called when the node enters the scene tree for the first time.
func _ready():
	targets = [$Target.position, $Target2.position]
	$YouWinText.hide()

func restart():
	$Player.position.x = 64
	$Player.position.y = 64
	$Crate.position.x = 128
	$Crate.position.y = 192
	$Crate2.position.x = 128
	$Crate2.position.y = 320
	$YouWinText.hide()
	playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") or \
	Input.is_key_pressed(KEY_Q):
		get_tree().quit(0)
	if Input.is_key_pressed(KEY_R):
		restart()
	if $Crate.position in targets and \
	$Crate2.position in targets :
		$YouWinText.show()
		$Player.velocity = Vector2.ZERO
		$Player/AnimatedSprite2D.play("down_calm")
		playing = false
