extends ParallaxBackground

@onready var spaceShip = get_node("/root/World/SpaceShip")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	scroll_offset.y += spaceShip.speed * delta
