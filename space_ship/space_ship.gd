extends Node2D

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
	if rigid.gravity_scale > 0:
		rigid.gravity_scale = 1 - (-rigid.position.y + 164) / 10000 
	else: 
		rigid.gravity_scale = 0

	if Input.is_action_pressed("ui_up"):
		var direction = rigid.rotation + deg_to_rad(270)	
		rigid.apply_force(Vector2(cos(direction), sin(direction)) * (power), rigid.center_of_mass)	
	
	if Input.is_action_pressed("ui_left"):
		rigid.apply_torque(-100)
	if Input.is_action_pressed("ui_right"):
		rigid.apply_torque(100)

func die():
	if isDying:
		return
		
	isDying = true	
	explosion.restart()
	killTimer.start()

func _on_area_2d_body_exited(body):
	die()

func _on_kill_timer_timeout():
	queue_free()
