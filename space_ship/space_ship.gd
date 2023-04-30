extends Node2D

@export var maxFuel: float = 120
@export var fuel: float = 120
@export var power: float = 1000
@onready var rigid: RigidBody2D = $RigidBody2D
@onready var explosion: CPUParticles2D = $RigidBody2D/Explosion
@onready var killTimer: Timer = $KillTimer

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
	if rigid.gravity_scale > 0.5:
		rigid.gravity_scale = 1 - (-rigid.position.y + 164) / 50000 
	else: 
		rigid.gravity_scale = 0.5

	if Input.is_action_pressed("ui_up") && fuel > 0:
		var direction = rigid.rotation + deg_to_rad(270)	
		rigid.apply_force(Vector2(cos(direction), sin(direction)) * (power), rigid.center_of_mass)	
		fuel-=delta
		
	if Input.is_action_pressed("ui_left") && fuel > 0:
		rigid.apply_torque(-100)
		fuel-=delta
		
	if Input.is_action_pressed("ui_right") && fuel > 0:
		rigid.apply_torque(100)
		fuel-=delta
		
	if fuel < 0:
		fuel = 0

	if rigid.position.x <= -500 || rigid.position.x >= 570:
		die()
	
func die():
	if isDying:
		return
	print("kill")
	rigid.freeze = true
	isDying = true
	explosion.restart()
	killTimer.start()
	
func _on_kill_timer_timeout():
	queue_free()
