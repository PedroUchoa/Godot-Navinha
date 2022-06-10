extends Node2D

var meteoroescolhido = 0
onready var velocidadeY = rand_range(100, 300)
onready var velocidadeX = rand_range(-50, 50)

signal explodiu(no)

func _ready():
	randomize()
	for a in $Meteoros.get_children():
		a.visible = false
	
	meteoroescolhido = ((randi() % $Meteoros.get_child_count()) + 1)
	
	var no = get_node("Meteoros/Meteoro" + str(meteoroescolhido))
	no.visible = true
	
	$area/CollisionShape2D.shape.radius = no.texture.get_width()/2

func _process(delta):
	translate(Vector2(velocidadeX, velocidadeY) * delta)
	
	if global_position.x > 260:
		global_position.x = -40
	if global_position.x < -40:
		global_position.x = 260	
		
	if global_position.y > 512:
		queue_free()


func _on_area_area_entered(area):
	get_tree().call_group("camera", "tremer", 1)
	emit_signal("explodiu", self)
	queue_free()
