extends Control

var _state_dict:Dictionary
@onready var _state:State = Services.state
@onready var _logs:LoggotLogger = Services.logs
@onready var _sounds:Sounds = Services.sounds

func _ready():
	_state_dict = _state.get_dict("main")
	_logs.info("Main scene > ready")
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon
	
func _exit_tree():
	_state.set_dict("main", {"state": 1})
	_logs.info("Main scene > exit")

func _on_button_pressed():
	_sounds.play("res://addons/GameBackend/sounds/interface/click_001.ogg")
	#scenes.change_scene_from_path_with_transite("res://test.tscn")
	$RigidBody2D.apply_impulse(Vector2(200, 200))
	#$RigidBody2D.apply_force(Vector2(20, 20))

func _on_resized():
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon

