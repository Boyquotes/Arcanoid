extends RigidBody2D

var _sounds:Sounds = Services.sounds
var _logs:LoggotLogger = Services.logs
var _interactive = null
const _id_interactive = "BALL"


func _ready():
	assert(_logs)
	assert(_sounds)
	_logs.info("Body rect > " + name)
	_interactive = Interactive.create(_id_interactive)
	if _interactive:
		_interactive.send_interactive_event.connect(_on_interactive_hitpoint_end)
		add_child(_interactive)


func _on_body_entered(body):
	if _interactive:
		_interactive.interact(body)
	match str(body.name):
		"SB_Dynamic_perimetr":
			_sounds.play("res://addons/GameBackend/sounds/impact/impactBell_heavy_004.ogg")
		"CB2D_platform":
			_sounds.play("res://addons/GameBackend/sounds/impact/impactGlass_light_000.ogg")
			
func _on_interactive_hitpoint_end(type, value):
	queue_free()
