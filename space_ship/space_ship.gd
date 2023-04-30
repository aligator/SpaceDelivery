extends Node2D

@export var maxFuel: float = 100
@export var fuel: float = 100
@export var power: float = 1200
@export var powerSide: float = 200
@onready var rigid: RigidBody2D = $RigidBody2D
@onready var explosion: CPUParticles2D = $RigidBody2D/Explosion
@onready var mainFire: CPUParticles2D = $RigidBody2D/MainFire
@onready var leftFire: CPUParticles2D = $RigidBody2D/LeftFire
@onready var rightFire: CPUParticles2D = $RigidBody2D/RightFire
@onready var killTimer: Timer = $KillTimer
@onready var texture = $RigidBody2D/Rocket

@onready var world = get_parent()

var isDying: bool = false

func start():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	mainFire.emitting = false
	leftFire.emitting = false
	rightFire.emitting = false
	
	if rigid.gravity_scale > 1:
		rigid.gravity_scale = 2 - (-rigid.position.y + 164) / 5000 
	else: 
		rigid.gravity_scale = 1

	if Input.is_action_pressed("ui_up") && fuel > 0:
		mainFire.emitting = true
		var direction = rigid.rotation + deg_to_rad(270)	
		rigid.apply_force(Vector2(cos(direction), sin(direction)) * (power), rigid.center_of_mass)	
		fuel-=delta * rigid.linear_velocity.length() / 200
		
	if Input.is_action_pressed("ui_left") && fuel > 0:
		rightFire.emitting = true
		rigid.apply_torque(-powerSide)
		fuel-=delta * rigid.linear_velocity.length() / 200
		
	if Input.is_action_pressed("ui_right") && fuel > 0:
		leftFire.emitting = true
		rigid.apply_torque(powerSide)
		fuel-=delta * rigid.linear_velocity.length() / 200
		
	if fuel < 0:
		fuel = 0

#	if rigid.position.x <= -500 || rigid.position.x >= 570:
#		die()
	if rigid.position.y > 0:
		die()
		
	if world.maxHeight > rigid.position.y:
		world.maxHeight = rigid.position.y
	
func die():
	if isDying:
		return
	print("kill")
	world.dead = true
	rigid.freeze = true
	isDying = true	
	explosion.restart()	
	killTimer.start()
	texture.visible = true
	
func _on_kill_timer_timeout():
	pass
