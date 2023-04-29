extends TextureButton

@export var scene: PackedScene
@export var count: int = 5

@onready var ship = get_tree().root.get_node("/root/World/SpaceShip")
@onready var ui = get_owner()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	disabled = count <= 0

func countUp():
	if ui.isInEditMode:
		count += 1

func _on_pressed():
	if ui.isInEditMode:
		var newObject: Node2D = scene.instantiate()
		ship.add_child(newObject)
		newObject.tree_exited.connect(countUp)
		count -= 1

