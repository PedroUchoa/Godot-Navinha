extends Sprite

export(NodePath) var nave  

var tempo = 0.0

func _ready():
	nave = get_node(nave)
	pass 


func _process(delta):
	tempo += delta
	material.set_shader_param("deslocamento", (nave.global_position.x - 80)* 0.002)
	material.set_shader_param("tempo", tempo)
