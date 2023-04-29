extends RigidBody2D

@export var power: float = 15000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = rotation + deg_to_rad(-180)	

	if Input.is_action_pressed("ui_left"):
		apply_force(Vector2(cos(direction), sin(direction)) * power, center_of_mass)	
	if Input.is_action_pressed("ui_right"):
		apply_force(Vector2(cos(direction), sin(direction)) * -power, center_of_mass)
		
	
