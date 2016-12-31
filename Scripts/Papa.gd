extends Node2D

var alimento = 20
var nombre = "Papa"
var textura = "res://Sprite/papa_2.png"

func _ready():
	get_node("Comida").set_atributos(nombre,alimento)
	get_node("Comida/Sprite").set_texture(load(textura))
	pass

func get_texture():
	return textura