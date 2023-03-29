extends DynamicBody2DItem

var _sounds:Sounds = Services.sounds
var speed:float = 200
var _counter = 1

signal send_final()


func _ready():
	assert(_sounds)
	super._ready()


func _on_body_entered(body):
	super._on_body_entered(body)
	if _counter % 9 == 0:
		speed += 50
	linear_velocity = linear_velocity.normalized() * speed
	_counter += 1
	
	match str(body.name):
		"SB_Dynamic_perimetr":
			_sounds.play("res://addons/GameBackend/sounds/impact/impactBell_heavy_004.ogg")
		#"CB2D_platform":
		#	_sounds.play("res://addons/GameBackend/sounds/impact/impactGlass_light_000.ogg")
			
func _on_interactive_hitpoint_end(_type, _value):
	emit_signal("send_final")
	queue_free()
