extends StaticBody2D

@onready var _logs:LoggotLogger = Services.logs
@onready var _interactives:Interactives = Services.interactives

func _ready():
	assert(_logs)
	_logs.info("Body rect > " + name)
	_interactives.create(self, "ONE_PUNCH_RECT")

	
