@tool
@icon("res://addons/ExtendedShape/2D/Cone/ConeShape2D.svg")
## A 2D cone shape used for physics collision..
## [br]Created by Healleu
##
##
## A 2D cone shape, intended for use physics. Usually used to provide a shape for a [CollisionShape2D].
## [br][b] Please, don't touch 'Points' property. It is calculated automatically.[/b]

class_name ConeShape2D extends ConvexPolygonShape2D


## Used internally
signal property_update

## The cone's angle.
@export_range(0, 180, 0.01) var angle : float = 90 :
	get:
		return angle
	set(value):
		angle = value
		property_update.emit()

## The cone's radius.
@export_range(0.01, 1024, 0.01) var radius : float = 10 :
	get:
		return radius
	set(value):
		radius = value
		property_update.emit()

## Number of points to draw the circle, [b]large number impact the performance.[/b]
## [br][b] Please, don't touch 'Points' property. It is calculated automatically.[/b]
@export_range(2, 100, 1) var point_count : int = 10 :
	get:
		return point_count
	set(value):
		point_count = value
		property_update.emit()

func _init() -> void :
	connect("property_update", _update)
	_update()
	return

func _update() -> void :
	var angle_diff : float = angle / (point_count - 1)
	var cloud_points : PackedVector2Array = [Vector2(0,0)]
	var angle_start : float = - angle / 2.0
	for index in point_count :
		var point : Vector2 = Vector2(radius * cos(deg_to_rad(angle_start)), radius * sin(-deg_to_rad(angle_start)))
		angle_start += angle_diff
		cloud_points.append(point)
	set_point_cloud(cloud_points)
	return
