extends StaticBody2DItem

func _ready():
	super._ready()
	get_tree().call_group("grid_tiles","on_group_grid_tiles", 1)

func _on_interactive_hitpoint_end(_type, _value):
	get_tree().call_group("grid_tiles","on_group_grid_tiles", -1)
	queue_free()

