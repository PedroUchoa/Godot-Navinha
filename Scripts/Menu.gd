extends Node2D

var opcao = 0
var piscar = 0


func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		opcao+=1
	if Input.is_action_just_pressed("ui_up"):
		opcao-=1
	if opcao < 0:
		opcao = $Items.get_child_count() - 1
	if opcao > $Items.get_child_count() - 1:
		opcao = 0	
		
	if Input.is_action_just_pressed("ui_accept"):
		match opcao:
			0:
				$Timer.start()
			1:
				$Timer_Creditos.start()
			2:
				get_tree().quit()		

	$seta.global_position = $Items.get_child(opcao).global_position	+ Vector2(-20, 10)


func _on_Timer_timeout():
	piscar+=1
	$Items/comeco.visible = not $Items/comeco.visible
	if piscar > 10.0:
		get_tree().change_scene("res://Cenas/Jogo.tscn")
		
		


func _on_Timer_Creditos_timeout():
	piscar+=1
	$Items/opcoes.visible = not $Items/opcoes.visible
	if piscar > 10.0:
		get_tree().change_scene("res://Cenas/Creditos.tscn")
