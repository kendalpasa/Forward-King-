extends Control

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Tutorial_Story.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainGame.tscn")
