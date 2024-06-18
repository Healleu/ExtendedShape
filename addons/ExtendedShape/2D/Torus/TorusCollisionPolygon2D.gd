@tool

class_name TorusCollisionPolygon2D
extends CollisionPolygon2D
## A 2D Torus collision polygon used for physics collision..
## [br]Created by Healleu
##
##
## A 2D Torus collision polygon, intended for use physics. Usually used to provide a shape for a [CollisionShape2D].
## [br][b] Please, don't touch 'Polygon' property. It is calculated automatically.[/b]

@export var radius : float = 10.0 :
	set(rad):
		radius = rad
		update_polygons()

@export var width: float = 1.0 :
	set(w):
		width = w
		update_polygons()

@export_range(6, 256) var quality: int = 64 :
	set(q):
		quality = q
		update_polygons()


func _ready() -> void :
	build_mode = CollisionPolygon2D.BUILD_SOLIDS
	update_polygons()
	return


func update_polygons() -> void :
	var points : PackedVector2Array = get_polygon_points(Vector2.ZERO, radius)
	polygon = points
	return


func get_polygon_points(center : Vector2, radius : float) -> PackedVector2Array:
	var half_width : float = width / 2.0
	var inner_circle : PackedVector2Array = get_circle_points(center, radius - half_width)
	var outer_circle : PackedVector2Array = get_circle_points(center, radius + half_width)
	inner_circle.reverse()
	var points : PackedVector2Array = PackedVector2Array()
	points.append_array(outer_circle)
	points.append_array(inner_circle)
	points.append(outer_circle[0] + Vector2(0.0001, 0.0001))
	return points


func get_circle_points(center : Vector2, radius : float, angle_from : float = 0, angle_to : float = 360) -> PackedVector2Array:
	var nb_points : int = 16
	var points_arc : PackedVector2Array = PackedVector2Array()
	for i : int in range(quality + 1):
		var angle_point : float = deg_to_rad(angle_from + i * (angle_to - angle_from) / quality - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	return points_arc
