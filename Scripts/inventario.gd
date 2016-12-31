extends Panel

var lista_items = {}

func _ready():
	pass


func iniciar_inventario():
	if lista_items.keys().size()>0:
		for i in lista_items:
			get_node("ItemList").add_item(lista_items[i][2],load(lista_items[i][1]))

func agregar_item(item):
	var num
	if lista_items.empty():
		num = 0
	else:
		num = lista_items.keys().size()+1
	lista_items[num] = [item.alimento,item.textura,item.nombre,item]
	get_node("ItemList").add_item(item.nombre,load(item.get_texture()))

func _on_Button_pressed():
	self.set_hidden(true)
	pass


func _on_ItemList_item_activated( index ):
	get_parent().add_child(lista_items[str(index)])
	lista_items[index].set_pos(get_parent().get_parent().get_node("Position2D").get_global_pos())
	get_node("ItemList").remove_item(index)
	lista_items.remove(index)
	pass
