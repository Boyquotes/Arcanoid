extends StaticBody2D

var _logs:LoggotLogger = Services.logs
var _interactive = null
const _id_interactive = "BALL_FINISH"


func _ready():
	assert(_logs)
	_logs.info("Body rect > " + name)
	_interactive = Interactive.create(_id_interactive)
	if _interactive:
		add_child(_interactive)

