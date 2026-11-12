extends Area2D

var how_many_times := 0
var default_text := ""
var player_inside := false

func _ready() -> void:

	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://game over.tscn")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = false
