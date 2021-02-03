extends RigidBody2D

export var min_speed = 25
export var max_speed = 150

export var life: int = 1

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()

func _ready():
	pass
