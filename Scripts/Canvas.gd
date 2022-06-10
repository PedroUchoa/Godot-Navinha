extends CanvasLayer

var pontuacao = 0

func _ready():
	pass 

func _process(delta):
	pass

func asteroide_explodido(meteor):
	var pontos = (6 - meteor.meteoroescolhido) * 10
	pontuacao += pontos
	$Valor.text = str(pontuacao)
