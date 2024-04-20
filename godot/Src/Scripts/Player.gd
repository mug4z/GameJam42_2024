extends CharacterBody2D

@export var max_fuel = 10
@export var fuel = 10
@export var recharge_time = 0.2
@export var move_speed = 3
@export var attack_speed = 0.01
@export var fire_speed = 13
@export var fire_duration = 2
@export var spread = 10
@export var fire_scale = 5

var flame = preload("res://Src/Actors/Fireball.tscn")

signal update_fuel # to emit signal on fuel quantity change. fuel UI recieves and auto updates
signal update_xp # to emit signal on xp quantity change. xp UI recieves and auto updates

var xp = 0
var level = 1

var attack_timer = 0
var recharge_timer = 0
var mouse_direction
 
func _process(delta):
	mouse_direction = global_position.direction_to(get_global_mouse_position())
	set_rotation_to_mouse()
	movement()
	fire(delta)

func movement():
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("move_right")):
		velocity.x += 1
	if(Input.is_action_pressed("move_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("move_down")):
		velocity.y += 1
	move_and_collide(velocity.normalized() * move_speed)
	
func set_rotation_to_mouse():
	rotation = mouse_direction.angle() + deg_to_rad(-90)

func fire(delta):
	if (Input.is_action_pressed("Fire") && fuel > 0 && attack_timer >= attack_speed):
		var new_flame = flame.instantiate()
		new_flame.rotation = mouse_direction.angle()
		new_flame.global_position = $FirePoint.global_position
		new_flame.velocity = mouse_direction.rotated(deg_to_rad(randf_range(-spread, spread))) * fire_speed + 2 * ( velocity * fire_speed / 3)
		new_flame.lifespan = fire_duration
		new_flame.fire_scale = Vector2(fire_scale, fire_scale)
		add_sibling(new_flame)
		fuel -= 1
		update_fuel.emit()
		attack_timer = 0
		
		xp += 10 * delta
		if xp >= 100:
			xp = 0
			level += 1
		update_xp.emit()
		update_fuel.emit()
	else:
		attack_timer += delta
	recharge_timer += delta
	if (recharge_timer >= recharge_time && fuel < max_fuel):
		fuel += 1
		update_fuel.emit()
		recharge_timer = 0
