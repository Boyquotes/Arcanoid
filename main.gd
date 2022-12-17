extends Node2D

#var last_flush_time = 0
#const FLUSH_RATE_SEC = 1
var state:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	state = Services.state.get_dict("main")
func _exit_tree():
	Services.state.set_dict("main", {"state": 1})


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	last_flush_time += delta
#	if last_flush_time >= FLUSH_RATE_SEC:
#		last_flush_time = 0
#		Services.log.info("I'am an async file appender")
#		Services.log.info("And I can log events in files")
#		Services.log.info("Without milliseconds")
#		Services.log.info("loss again \\o/")
