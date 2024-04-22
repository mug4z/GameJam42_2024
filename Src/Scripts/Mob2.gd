extends Area2D

var mob_instance = [preload("res://Src/Actors/mob1.tscn"), preload("res://Src/Actors/mob2.tscn"), preload("res://Src/Actors/mob3.tscn")]

var center_position = Vector2(0,0)

var immortal = 0
var density = 0

@onready var area_check = $"propagate area"
@export var max_density = 4
@export var exp_point = 4
@export var life = 2
@onready var coo_player = $"../../Player"
var Tier = 2

func _init():
	pass
func _ready():
	density = area_check.get_overlapping_areas().size()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

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
