extends Control

signal return_to_about_screen


func _on_Return_pressed():
	emit_signal("return_to_about_screen")
