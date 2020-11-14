extends KinematicBody2D
class_name Player


const IDLE = "idle"
const WALKING = "walking"
const WALKING_UP = "walkingUp"
const WALKING_DOWN = "walkingDown"

const UI_RIGHT = "ui_right"
const UI_LEFT = "ui_left"
const UI_DOWN = "ui_down"
const UI_UP = "ui_up"

export var switch_diagonal_animation = false
export var speed = 400
var screen_size
var heading = Vector2()
var velocity = Vector2()


var inventoryComponent = load("res://Components/Inventory.gd")
var inventory: Inventory = inventoryComponent.new()

var identityComponent = load("res://Components/Identity.gd")
var identity: Identity = identityComponent.new()
onready var character: Character = identity.getComponent()
onready var canMove = true


func _ready():
	print("PLAYER READY")
	screen_size = get_viewport_rect().size
	# character setup
	$AnimatedSprite.frames = character.frames
	$CollisionShape2D.shape = character.collision_shape



	
func _process(delta):
	update_heading()
	update_animations()
	update_velocity()

func _physics_process(delta):
	move_and_slide(velocity) # don't multiply by delta for move_and_slide

func update_heading():
	# calculate X heading
	if !canMove:
		return
	
	if Input.is_action_just_pressed(UI_RIGHT):
		heading.x = 1
	elif Input.is_action_just_released(UI_RIGHT):
		heading.x = -1 if Input.is_action_pressed(UI_LEFT) else 0
	if Input.is_action_just_pressed(UI_LEFT):
		heading.x = -1
	elif Input.is_action_just_released(UI_LEFT):
		heading.x = 1 if Input.is_action_pressed(UI_RIGHT) else 0
	# calculate Y heading
	if Input.is_action_just_pressed(UI_DOWN):
		heading.y = 1
	elif Input.is_action_just_released(UI_DOWN):
		heading.y = -1 if Input.is_action_pressed(UI_UP) else 0
	if Input.is_action_just_pressed(UI_UP):
		heading.y = -1
	elif Input.is_action_just_released(UI_UP):
		heading.y = 1 if Input.is_action_pressed(UI_DOWN) else 0

func update_animations():
	$AnimatedSprite.play()
	if heading != Vector2.ZERO:
		if heading.x != 0:

			$AnimatedSprite.flip_h = heading.x < 0
		if switch_diagonal_animation:
			if heading.y != 0:
				changeAnimation(WALKING_UP if heading.y < 0 else WALKING_DOWN)
#				$AnimatedSprite.animation = WALKING_UP if heading.y < 0 else WALKING_DOWN
			else:
				changeAnimation(WALKING)
#				$AnimatedSprite.animation = WALKING
		else:
			if heading.x != 0:
				changeAnimation(WALKING)
#				$AnimatedSprite.animation = WALKING
			else:
				changeAnimation(WALKING_UP if heading.y < 0 else WALKING_DOWN)
	else:
		changeAnimation(IDLE)


func changeAnimation(truth: String):
	if $AnimatedSprite.animation != truth:
		$AnimatedSprite.animation = truth

func update_velocity():
	if heading != Vector2.ZERO:
		velocity = heading.normalized() * speed
	else:
		velocity = Vector2.ZERO
