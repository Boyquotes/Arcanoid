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
		get_tree().call_group("grid_tiles","on_group_grid_tiles", 1)
		
func _on_interactive_hitpoint_end(_type, _value):
	get_tree().call_group("grid_tiles","on_group_grid_tiles", -1)
	queue_free()

	
