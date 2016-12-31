extends Node

var pathDatos = "res://SaveGame/datos_pet.txt"
var archivo_datos = File.new()

func _ready():
	inicializar()
	pass

func inicializar():
	if File.new().file_exists(pathDatos):
		get_node("boton_continuar").set_disabled(false)

func _on_boton_nueva_partida_pressed():
	archivo_datos.open(pathDatos,File.WRITE)
	var fecha = OS.get_datetime()
	archivo_datos.store_string("comida = 100")
	archivo_datos.store_string("\r\n")
	archivo_datos.store_string("sed = 100")
	archivo_datos.store_string("\r\n")
	archivo_datos.store_string("cansancio = 0")
	archivo_datos.store_string("\r\n")
	archivo_datos.store_string("inventario = {}")
	archivo_datos.store_string("\r\n")
	archivo_datos.store_string("creacion = "+str(fecha.to_json()))
	archivo_datos.store_string("\r\n")
	archivo_datos.store_string("ultima_conexion = ")
	archivo_datos.close()
	get_tree().change_scene("res://Escenas/UI.tscn")
	pass


func _on_boton_continuar_pressed():
	get_tree().change_scene("res://Escenas/UI.tscn")
	pass # replace with function body
