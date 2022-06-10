extends Camera2D

var tempo = 0
var treme = 0


func _ready():
	pass


func _process(delta):
	if treme > 0:
		tempo += delta *100
		global_position = Vector2(treme,treme).rotated(tempo)
		treme = lerp(treme, 0 , .1)	


func tremer(v):
	treme += v
