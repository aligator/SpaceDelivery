extends StaticBody2D

@export var power: Vector2 = Vector2(4, 0)
@export var isLeft: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	constant_linear_velocity = Vector2(0, 0)
	if isLeft && Input.is_action_pressed("ui_left"):
		constant_linear_velocity = power
	if !isLeft && Input.is_action_pressed("ui_right"):
		constant_linear_velocity = -power
	
	print(constant_linear_velocity)
