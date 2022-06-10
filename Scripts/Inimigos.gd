extends Node2D

const PRE_METEORO = preload("res://Cenas/Meteoro.tscn")
const PRE_EXPLOSAO = preload("res://Cenas/Explosão.tscn")


export(NodePath) var nave  



func _ready():
	cairMeteoro()
	nave = get_node(".")
	pass 


func _process(delta):
	global_position.x = (nave.global_position.x - 80) * 0.002 * -128


func _on_Timer_timeout():
	var meteor = PRE_METEORO.instance()
	meteor.connect("explodiu" , self, "asteroide_destruido")
	add_child(meteor)
	meteor.global_position = (Vector2(rand_range(60 , 140) , -40))
	cairMeteoro()

func cairMeteoro():
	$Timer.wait_time = rand_range(.2 , .3)
	$Timer.start()

func asteroide_destruido(meteor):
	get_tree().call_group("Hud", "asteroide_explodido" , meteor)
	var e = PRE_EXPLOSAO.instance()
	add_child(e) 
	e.global_position = meteor.global_position
