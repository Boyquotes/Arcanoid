extends Node2D

var state_dict:Dictionary
@onready var state:State = Services.state
@onready var logs:LoggotLogger = Services.logs
@onready var scenes:Scenes = Services.scenes
@onready var sounds:Sounds = Services.sounds

func _ready():
	state_dict = state.get_dict("main")
	logs.info("Main scene > ready")
	
func _exit_tree():
	state.set_dict("main", {"state": 1})
	logs.info("Main scene > exit")

func _on_button_pressed():
	sounds.play("res://addons/GameBackend/sounds/interface/click_001.ogg")
	scenes.change_scene_from_path_with_transite("res://test.tscn")
