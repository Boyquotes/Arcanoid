extends Button

var state_dict:Dictionary
@onready var state:State = Services.state
@onready var logs:LoggotLogger = Services.logs
@onready var scenes:Scenes = Services.scenes
@onready var sounds:Sounds = Services.sounds

# Called when the node enters the scene tree for the first time.
func _ready():
	state_dict = state.get_dict(name)
	logs.info("Test scene > ready")


func _exit_tree():
	state.set_dict(name, {"state": 1})
	logs.info("Test scene > exit")


func _on_pressed():
	sounds.play("res://addons/GameBackend/sounds/interface/click_001.ogg")
	scenes.change_scene_from_path_with_transite("res://main.tscn")
