extends Node2D

export(NodePath) var nave  


func _ready():
	nave = get_node(nave)
	pass 


func _process(delta):
	global_position.x = (nave.global_position.x - 80) * 0.002 * -128
