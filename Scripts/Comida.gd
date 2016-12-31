extends RigidBody2D

var pet = preload("res://Scripts/pet.gd")
var alimento
var nombre

func _ready():
	pass

func set_atributos(nombre,cant):
	self.nombre = nombre
	self.alimento = cant

func _on_Comida_body_enter( body ):
	if body extends pet:
		body.set_comida(body.get_comida()+alimento)
		queue_free()
	pass
