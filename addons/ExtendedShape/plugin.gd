@tool
extends EditorPlugin

var version : String = ""

func _enter_tree() -> void :
	add_custom_type("ConeShape2D", "ConvexPolygonShape2D", preload("2D/Cone/ConeShape2D.gd"), preload("2D/Cone/ConeShape2D.svg"))
	version = get_plugin_version()
	print("Plugin Extended Shape " + version + " initialized!")
	return
	
func _exit_tree() -> void :
	remove_custom_type("ConeShape2D")
	print("Plugin Extended Shape " + version + " deinitialized!")
	return
