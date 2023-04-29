extends RigidBody2D

@onready var ui = get_node("/root/World/UI")
@onready var spaceShipPlacementArea: Area2D = get_node("/root/World/SpaceShip/PlacementArea")
@onready var parent = get_parent()

var doMove: bool = false

func _physics_process(delta):
	freeze = doMove
	if doMove:
		rotation = 0
		global_transform.origin = get_global_mouse_position() - Vector2(32, 32)


func _on_input_event(viewport, event, shape_idx):
	if !ui.isInEditMode:
		return
	
	if event is InputEventMouseButton:
		if event.pressed:
			if !doMove:
				doMove = true
			else:
				print("test")
				if spaceShipPlacementArea.overlaps_body(self):
					print("inside")
					doMove = false
		
