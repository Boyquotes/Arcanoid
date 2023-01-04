extends Control

var state_dict:Dictionary
@onready var state:State = Services.state
@onready var logs:LoggotLogger = Services.logs
@onready var scenes:Scenes = Services.scenes
@onready var sounds:Sounds = Services.sounds

func _ready():
	state_dict = state.get_dict("main")
	logs.info("Main scene > ready")
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon
	
func _exit_tree():
	state.set_dict("main", {"state": 1})
	logs.info("Main scene > exit")

func _on_button_pressed():
	sounds.play("res://addons/GameBackend/sounds/interface/click_001.ogg")
	#scenes.change_scene_from_path_with_transite("res://test.tscn")
	$RigidBody2D.apply_impulse(Vector2(200, 200))
	#$RigidBody2D.apply_force(Vector2(20, 20))

func _on_resized():
	var polygon:PackedVector2Array = [Vector2(0, 0), Vector2(size.x, 0), Vector2(size.x, size.y), Vector2(0, size.y)]
	$SB_Dynamic_perimetr/CollisionPolygon2D.polygon = polygon


func _on_rigid_body_2d_body_entered(body):
	match str(body.name):
		"SB_Blue_rect":
			sounds.play("res://addons/GameBackend/sounds/impact/impactMining_000.ogg")
			body.queue_free()
		"SB_Dynamic_perimetr":
			sounds.play("res://addons/GameBackend/sounds/impact/impactBell_heavy_004.ogg")
		"CB2D_platform":
			sounds.play("res://addons/GameBackend/sounds/impact/impactGlass_light_000.ogg")
			

