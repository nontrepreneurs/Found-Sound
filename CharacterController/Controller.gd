extends Area2D
signal hit

const IDLE = "idle"
const WALKING = "walking"
const WALKING_UP = "walkingUp"
const WALKING_DOWN = "walkingDown"

export var switch_diagonal_animation = false
export var speed = 400
var screen_size
var heading = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	move(delta)

func move(delta):
	var velocity = Vector2()
	
	# calculate X heading
	if Input.is_action_just_pressed("ui_right"):
		heading.x = 1
	elif Input.is_action_just_released("ui_right"):
		heading.x = -1 if Input.is_action_pressed("ui_left") else 0
	if Input.is_action_just_pressed("ui_left"):
		heading.x = -1
	elif Input.is_action_just_released("ui_left"):
		heading.x = 1 if Input.is_action_pressed("ui_right") else 0
	# calculate Y heading
	if Input.is_action_just_pressed("ui_down"):
		heading.y = 1
	elif Input.is_action_just_released("ui_down"):
		heading.y = -1 if Input.is_action_pressed("ui_up") else 0
	if Input.is_action_just_pressed("ui_up"):
		heading.y = -1
	elif Input.is_action_just_released("ui_up"):
		heading.y = 1 if Input.is_action_pressed("ui_down") else 0
	
	# calculate animations and velocity
	if heading != Vector2.ZERO:
		if heading.x != 0:
			$AnimatedSprite.flip_h = heading.x < 0
		
		if switch_diagonal_animation:
			if heading.y != 0:
				$AnimatedSprite.animation = WALKING_UP if heading.y < 0 else WALKING_DOWN
			else:
				$AnimatedSprite.animation = WALKING
		else:
			if heading.x != 0:
				$AnimatedSprite.animation = WALKING
			else:
				$AnimatedSprite.animation = WALKING_UP if heading.y < 0 else WALKING_DOWN
		
		velocity = heading.normalized() * speed
	else:
		$AnimatedSprite.animation = IDLE
		# velocity is already Vector2.ZERO
	
	# apply velocity
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
