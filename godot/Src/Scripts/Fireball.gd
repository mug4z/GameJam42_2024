extends Area2D

var lifespan = 1
var velocity = Vector2(10,0)
var fire_scale = Vector2(1,1)
var timer = 0

func _ready():
	#lifespan = randf_range(1,2)
	scale = fire_scale
	$Animation.play()

func _physics_process(delta):
	global_position += velocity

func _process(delta):
	rotation = velocity.angle() + deg_to_rad(180)
	timer += delta
	if (timer >= lifespan):
		free()

#func _on_body_entered(body):
#	queue_free()
#	body.queue_free()
