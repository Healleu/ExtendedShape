extends Area2D

@onready var path_follow = get_parent()

const SPEED : float = 120.0

func _process(delta):
	if path_follow is PathFollow2D :
		path_follow.progress += SPEED * delta
	return

func _on_area_entered(area: Area2D) -> void:
	$CanvasLayer/Label.show()
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	$CanvasLayer/Label.hide()
	pass # Replace with function body.
