extends Control

@export var isInEditMode: bool = true
@onready var ship = get_tree().root.get_node("/root/World/SpaceShip")
@onready var shipBody: RigidBody2D = get_tree().root.get_node("/root/World/SpaceShip/RigidBody2D")
@onready var startButton: Button = $StartButton
@onready var spawners: HBoxContainer = $Spawners

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shipBody.freeze = isInEditMode
	pass


func _on_button_pressed():
	isInEditMode = false
	startButton.visible = false
	spawners.visible = false
	ship.start()

