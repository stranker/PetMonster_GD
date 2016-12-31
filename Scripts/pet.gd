extends RigidBody2D

var comida setget set_comida, get_comida
var sed setget set_sed, get_sed
var cansancio setget set_cansancio, get_cansancio
var creacion = {}
var ultima_conexion = {}
var archivo = File.new()
var pathDatos = "res://SaveGame/datos_pet.txt"

func _ready():
	pass

#SETTERS Y GETTERS
func set_comida(num):
	comida = num
func set_sed(num):
	sed = num
func set_cansancio(num):
	cansancio = num

func get_comida():
	return comida
func get_sed():
	return sed
func get_cansancio():
	return cansancio
func get_creacion():
	return creacion

#INICIALIZAR PET
func inicializarPet():
	setear_datos_archivo()
	if ultima_conexion.keys().size()>1: #SI NO ES PARTIDA NUEVA
		actualizar_datos_ultima_conexion()
	

func setear_datos_archivo():
	archivo.open(pathDatos,File.READ)
	while(not(archivo.eof_reached())):
		var lineaSpliteada = archivo.get_line().split(" = ")
		if(lineaSpliteada[0]=="comida"):
			set_comida((lineaSpliteada[1]).to_float())
		if(lineaSpliteada[0]=="sed"):
			set_sed((lineaSpliteada[1]).to_float())
		if(lineaSpliteada[0]=="cansancio"):
			set_cansancio((lineaSpliteada[1]).to_float())
		if(lineaSpliteada[0]=="creacion"):
			creacion.parse_json(lineaSpliteada[1])
		if(lineaSpliteada[0]=="ultima_conexion"):
			ultima_conexion.parse_json(lineaSpliteada[1])
		if(lineaSpliteada[0]=="inventario"):
			get_parent().get_node("Inventario/inventario_list").lista_items.parse_json(lineaSpliteada[1])
	archivo.close()
	pass

func actualizar_datos_ultima_conexion():
	var minutos = self.diferencia_fecha_minutos(OS.get_datetime(),ultima_conexion)
	set_comida(comida-floor(minutos/2))
	set_sed(sed-floor(minutos/2))
	if comida<0:
		comida = 0
	if sed<0:
		sed = 0
	pass

#DISMINUIR ATRIBUTOS
func _on_Timer_vida_timeout():
	if comida>0:
		set_comida(comida-1)
	pass

func _on_Timer_sed_timeout():
	if sed>0:
		set_sed(sed-1)
	pass
# PASAR FECHA A MINUTOS
func diferencia_fecha_minutos(fecha_ultima,fecha_inicial):
	var minutos_anio = (fecha_ultima["year"]-fecha_inicial["year"])*365*24*60
	var minutos_mes = (fecha_ultima["month"]-fecha_inicial["month"])*30*24*60
	var minutos_dia = (fecha_ultima["day"]-fecha_inicial["day"])*24*60
	var minutos_hora = (fecha_ultima["hour"]-fecha_inicial["hour"])*60
	var minutos_minutos = (fecha_ultima["minute"]-fecha_inicial["minute"])
	return minutos_anio+minutos_mes+minutos_dia+minutos_hora+minutos_minutos

#INVENTARIO

func agregar_item_inventario(item):
	get_parent().get_node("Inventario/inventario_list").agregar_item(item)
	pass

#GUARDAR DATOS
func guardarDatos():
	var fecha = OS.get_datetime()
	archivo.open(pathDatos,File.WRITE)
	archivo.store_string("comida = "+str(self.get_comida()))
	archivo.store_string("\r\n")
	archivo.store_string("sed = "+str(self.get_sed()))
	archivo.store_string("\r\n")
	archivo.store_string("cansancio = "+str(self.get_cansancio()))
	archivo.store_string("\r\n")
	archivo.store_string("inventario = "+str(get_parent().get_node("Inventario/inventario_list").lista_items.to_json()))
	archivo.store_string("\r\n")
	archivo.store_string("creacion = "+str(creacion.to_json()))
	archivo.store_string("\r\n")
	archivo.store_string("ultima_conexion = "+str(fecha.to_json()))
	archivo.close()
