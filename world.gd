extends Node2D

@export var maxHeight = 0
@export var dead = false

@onready var ui = $UI
@onready var highscore = $Highscore
@onready var highscoreList = $HighscoreList

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ui.visible = !dead
	
	if !highscoreList.visible:
		highscore.visible = dead
