extends Button

var papa_escena = preload("res://Escenas/Papa.tscn")

func _ready():
	pass

func _on_papa_pressed():
	var papa = papa_escena.instance(true)
	get_parent().get_node("Pet").agregar_item_inventario(papa)
	pass # replace with function body
