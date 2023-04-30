extends RigidBody2D

var doMove: bool = false

func _ready():
	var onScreen = VisibleOnScreenNotifier2D.new()
	add_child(onScreen)
	onScreen.screen_exited.connect(_on_screen_exited)

func _physics_process(delta):
	if position.y > 0:
		queue_free()
	pass
		
func _on_screen_exited():
	print("exit")
	queue_free()

