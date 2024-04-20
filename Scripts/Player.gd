extends Sprite2D

var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2(0,0)
	if(Input.is_action_pressed("r")):
		velocity.x += 10
	if(Input.is_action_pressed("l")):
		velocity.x -= 10
	if(Input.is_action_pressed("d")):
		velocity.y += 10
	if(Input.is_action_pressed("u")):
		velocity.y -= 10
	position += velocity
