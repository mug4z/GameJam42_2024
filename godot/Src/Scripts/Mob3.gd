extends Area2D

var mob_instance = [preload("res://Src/Actors/mob1.tscn"), preload("res://Src/Actors/mob2.tscn"), preload("res://Src/Actors/mob3.tscn")]

var center_position = Vector2(0,0)

var immortal = 0
var density = 0

@onready var area_check = $"propagate area"
@export var max_density = 5
@export var exp_point = 10
@export var life = 3

var Tier = 3

func _init():
	pass
func _ready():
	density = area_check.get_overlapping_areas().size()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
func propagate():
	if (density < max_density && Tier > 2):
		var new_sprite = mob_instance[randi_range(0,1)].instantiate()
		add_sibling(new_sprite)  # Adding as a sibling to maintain same parent
		var current_global_position = global_position  # Use global position
		# Calculate direction from current global position to the global center
		var direction = (center_position - current_global_position).normalized()
		# Introduce randomness to the direction
		var random_angle = deg_to_rad(randi_range(-90,90))  # Random angle between -22.5 to +22.5 degrees
		direction = direction.rotated(random_angle)
		var base_distance = 600  # Base distance
		var random_distance = base_distance * randf_range(0.5, 1.5)  # Randomize distance by 20%
		new_sprite.global_position = current_global_position + direction * random_distance

func _on_timer_timeout():
	#print("test")
	density = area_check.get_overlapping_areas().size()
	propagate()
	pass # Replace with function body.



func hit(bullet):
	if (!immortal):
		life -= 1
		if life < 1:
			bullet.gain_xp(exp_point)
			queue_free()


func _on_timer_2_timeout():
	if Tier < 3:
		var new_sprite = mob_instance[Tier].instantiate()
		add_sibling(new_sprite)  # Adding as a sibling to maintain same parent
		new_sprite.global_position = position
		queue_free()
