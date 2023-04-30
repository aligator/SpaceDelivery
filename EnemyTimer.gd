extends Timer

@export var objectScene: PackedScene = null
@onready var spaceShipRigid: RigidBody2D = get_node("/root/World/SpaceShip/RigidBody2D")
@onready var spaceShip: Node2D = get_node("/root/World/SpaceShip")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	pass
	
func _on_timeout():
	print(spaceShipRigid.position.y)
	if spaceShipRigid.position.y > -3000:
		return
		
	var newEnemy: RigidBody2D = objectScene.instantiate()
	newEnemy.position = spaceShipRigid.position + spaceShip.position
	newEnemy.position.y -= 800
	newEnemy.position.x = randi_range(50, 1100)
	newEnemy.gravity_scale = randf_range(0.2, 0.3)

	var scale = randf_range(0.1, 0.4)	
	newEnemy.get_node("./CollisionShape2D").scale = Vector2(scale, scale)
	newEnemy.get_node("./Sprite2D").scale = Vector2(scale, scale)
	
	add_child(newEnemy)
	pass # Replace with function body.
