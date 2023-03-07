extends GridContainer

signal send_tiles_finish() 
var _interact_tiles = 0


func _ready():
	pass
	
func on_group_grid_tiles(value:int):
	_interact_tiles += value
	
	if _interact_tiles == 0:
		emit_signal("send_tiles_finish")
