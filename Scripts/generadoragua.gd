extends Button

var escena_agua = preload("res://Escenas/Agua.tscn")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_agua_pressed():
	var agua = escena_agua.instance(true)
	get_parent().add_child(agua)
	agua.set_pos(get_parent().get_node("Position2D").get_global_pos())
	pass # replace with function body
