extends Node2D

const cena_tiro = preload("res://Cenas/Tiro.tscn")

var velocidade = 220.0

var escudo = 100.0


onready var tamanho_escudo = $Escudo/Sprite.material.get_shader_param("size")

onready var shape = $Area2D/CollisionShape2D.shape.radius

export(NodePath) var tiros


func _ready():
	if tiros:
		tiros = get_node(tiros)
	else:
		tiros = get_parent()	
func _process(delta):
	var ladoX = 0
	var ladoY = 0
	
	if Input.is_action_pressed("ui_left"):
		ladoX += -1
	
	if Input.is_action_pressed("ui_right"):
		ladoX += 1
	
	if Input.is_action_pressed("ui_up"):
		ladoY += -1
	
	if Input.is_action_pressed("ui_down"):
		ladoY += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("Tiros").size() < 6:
			var tiro = cena_tiro.instance()
			tiros.add_child(tiro)
			tiro.global_position = $Tiro.global_position
		
	translate(Vector2(ladoX,ladoY) * velocidade * delta)
	pass
	
	global_position.x = clamp(global_position.x , 16 , 241)
	global_position.y = clamp(global_position.y , 18 , 481)


func _on_Area2D_area_entered(area):
	get_tree().call_group("camera", "tremer", 1)
	escudo -= 1
	$Area2D/CollisionShape2D.shape.radius = shape * escudo / 100.0
	$Escudo/Sprite.material.set_shader_param("size", tamanho_escudo * escudo / 100.0 )


func _on_Morte_area_entered(area):
	visible =false
	set_process(false)
	get_tree().change_scene("res://Cenas/Game_Over.tscn")
	print(get_node("../CanvasLayer").pontuacao)
	
