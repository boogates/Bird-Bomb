extends RigidBody2D

var screen_size
var plBomb : = preload("res://project/src/Bomb.tscn")

export var strength : float = 200

func _ready():
	screen_size = get_viewport_rect().size
	show()

func _process(_delta):
	if Input.is_action_just_pressed("flap"):
		if Input.is_action_pressed("ui_right"):
			var direction = Vector2(1, -1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
		
		if Input.is_action_pressed("ui_left"):
			var direction = Vector2(-1, -1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
		
		if Input.is_action_pressed("ui_down"):
			var direction = Vector2(0, 1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			
		else:
			var direction = Vector2(0, -1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			
	if Input.is_action_just_pressed("bomb"):
		var bomb : = plBomb.instance()
		bomb.position = position
		get_tree().current_scene.add_child(bomb)
