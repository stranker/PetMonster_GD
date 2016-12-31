extends Node

func _ready():
	set_process(true)
	get_node("Pet").inicializarPet()
	pass

func _process(delta):
	obtenerDatosPet()
	pass

func obtenerDatosPet():
	get_node("barraComida").set_value(get_node("Pet").get_comida())
	get_node("barraCansancio").set_value(get_node("Pet").get_cansancio())
	get_node("barraSed").set_value(get_node("Pet").get_sed())
	

func _on_Button_pressed():
	get_node("Pet").guardarDatos()
	get_tree().quit()
	pass # replace with function body


func _on_Inventario_pressed():
	get_node("Inventario/inventario_list").iniciar_inventario()
	get_node("Inventario/inventario_list").set_hidden(false)
	pass # replace with function body
