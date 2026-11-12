extends Area2D

var how_many_times := 0
var default_text := ""
var player_inside := false

func _ready() -> void:
	$Label3.hide()
	default_text = $Label3.text
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("epeecee"):
		get_tree().change_scene_to_file("res://glasses.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = true
		how_many_times += 1
		print(how_many_times)
		if how_many_times == 10:
			$Label3.text = "Press E to use the glasses. i thought that was common knowledge."
		else:
			$Label3.text = default_text
		$Label3.show()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = false
		$Label3.hide()
