extends RigidBody2D

var pet = preload("res://Scripts/pet.gd")
var sed
var nombre

func _ready():
	pass

func set_atributos(nombre,cant):
	self.nombre = nombre
	self.sed = cant

func _on_Bebida_body_enter( body ):
	if body extends pet:
		body.set_sed(body.get_sed()+sed)
		queue_free()
	pass # replace with function body
