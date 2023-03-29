extends Control

var _state_dict:Dictionary
@onready var _state:State = Services.state
@onready var _logs:LoggotLogger = Services.logs
@onready var _sounds:Sounds = Services.sounds
@onready var _locations:Locations = Services.locations
var _ball_pc = preload("res://assets/items/RB2DBall.tscn")
var _ball:Node2D = null
var _lifes = 5
var _location_node:Node = null

const _localion_name = "main"
const _lives_key = "lives"

func _ready():
	_state_dict = _state.get_dict("main")
	_logs.info("Main scene > ready")
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon
	
	var loc_cfg_dict = _locations.get_cfg_dict_for_location(_localion_name)
	var lifes_dict = loc_cfg_dict.get(_lives_key, {}) as Dictionary
	_lifes = lifes_dict.get(_lives_key, 5)
	
	_location_node = _locations.get_next_level_for_location(_localion_name) as Node
	if _location_node:
		$C_grid.add_child(_location_node)
		_location_node.send_tiles_finish.connect(on_tiles_finish)
		_state_start()
	else:
		_logs.error("Main scene > level for location {0} not load.".format([_localion_name]))
	
func _exit_tree():
	_state.set_dict("main", {"state": 1})
	_logs.info("Main scene > exit")

func _on_button_pressed():
	_sounds.play("res://addons/GameBackend/sounds/interface/click_001.ogg")
	if _ball:
		_ball.apply_impulse(Vector2(200, 200))

func _on_resized():
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon
	$SB_ball_finish.position.y = size.y - 5
	$SB_ball_finish/CollisionShape2D.shape.size.x = size.x

func _state_start():
	$MC_level_hud.hud_event(HUD.EHandler.LIFE, HUD.EType.ADD, _lifes)
	call_deferred("create_ball")
	
func _state_success():
	if _location_node:
		_locations.location_level_passed(_localion_name, _location_node.name)
	OS.alert("lavel success")
	
func _state_fail():
	OS.alert("lavel fail")
	
func _state_ball_mash():
	on_ball_mash()
	
func on_ball_mash():
	$MC_level_hud.hud_event(HUD.EHandler.LIFE, HUD.EType.REMOVE, 1)
	_lifes -= 1
	if _lifes == 0:
		_check_finish_condition()
	else:
		call_deferred("create_ball")
	
func create_ball():
	_ball = _ball_pc.instantiate() as Node2D
	add_child(_ball)
	_ball.send_final.connect(on_ball_mash)
	_ball.position = $CB2D_platform.position + Vector2(30, -30)

func _check_finish_condition():
	if _lifes > 0:
		_state_success()
	else:
		_state_fail()

func on_tiles_finish():
	_check_finish_condition()

