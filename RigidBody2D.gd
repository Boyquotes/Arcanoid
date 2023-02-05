extends RigidBody2D

@onready var _sounds:Sounds = Services.sounds
@onready var _interactives:Interactives = Services.interactives
@onready var _logs:LoggotLogger = Services.logs


func _ready():
	assert(_logs)
	_logs.info("Body rect > " + name)
	assert(_interactives)
	_interactives.create(self, "BALL")


func _on_body_entered(body):
	_interactives.interact(self, body)
	match str(body.name):
		"SB_Dynamic_perimetr":
			_sounds.play("res://addons/GameBackend/sounds/impact/impactBell_heavy_004.ogg")
		"CB2D_platform":
			_sounds.play("res://addons/GameBackend/sounds/impact/impactGlass_light_000.ogg")
