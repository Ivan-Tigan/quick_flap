extends Node2D

onready var obstacle_scene = preload("res://obstacle.tscn")

const gravity := 340.0
const up_force := -120.0

var velocity := Vector2.ZERO
var score := 0

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = up_force
		$flap.play()
	$bird.move_and_slide(velocity)
	
	for o in get_tree().get_nodes_in_group("pipes"):
		o.move_and_slide(Vector2.LEFT * 85.0)
	
	$score.text = str(score)
	
func _on_timer_timeout() -> void:
	var obstacle_instance = obstacle_scene.instance()
	obstacle_instance.position = Vector2(215, rand_range(35, 75))
	add_child(obstacle_instance)
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacle"): 
		get_tree().reload_current_scene()
	if area.is_in_group("score"):
		score += 1
		$ding.play()


