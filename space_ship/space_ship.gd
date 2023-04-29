extends Node2D

@export var power: float = 25

@export var targetSpeed: float = 0
@export var speed: float = 0
@export var acceleration: float = 500

@onready var rigid: RigidBody2D = $RigidBody2D

func start():
	targetSpeed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speed < targetSpeed:
		speed += acceleration * delta
	elif speed > targetSpeed:
		speed -= acceleration * delta

	var direction = rigid.rotation + deg_to_rad(-180)	

	if Input.is_action_pressed("ui_left"):
		rigid.apply_force(Vector2(cos(direction), sin(direction)) * (power * speed), rigid.center_of_mass)	
	if Input.is_action_pressed("ui_right"):
		rigid.apply_force(Vector2(cos(direction), sin(direction)) * (power * -speed), rigid.center_of_mass)
