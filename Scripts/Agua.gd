extends Node2D

var sed = 30
var nombre = "Agua"

func _ready():
	get_node("Bebida").set_atributos(nombre,sed)
	get_node("Bebida/Sprite").set_texture(load("res://Sprite/agua.png"))
	pass

func get_texture():
	get_node("Bebida/Sprite").get_texture()