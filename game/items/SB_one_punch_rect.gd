extends StaticBody2D

var _logs:LoggotLogger = Services.logs
var _interactive = null
const _id_interactive = "BLUE_TILE"

func _ready():
	assert(_logs)
	_logs.info("Body rect > " + name)
	_interactive = Interactive.create(_id_interactive)
	if _interactive:
		_interactive.send_interactive_event.connect(_on_interactive_hitpoint_end)
		add_child(_interactive)
		
func _on_interactive_hitpoint_end(type, value):
	queue_free()

	
