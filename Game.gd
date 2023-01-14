#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

extends Node2D

export var level : PackedScene = preload("res://Levels/Level.tscn")

var end_screen : PackedScene = preload("res://UI/EndScreen.tscn")

onready var _start_screen := $UILayer/StartScreen
onready var _hud := $UILayer/HUD
onready var _end_screen := $UILayer/EndScreen
onready var _about_screen := $UILayer/AboutScreen

var _score := 0
var _current_level


func _ready() -> void:

	EventBusAndConstants.connect("score_increased", self, "update_score")

	

	
func _create_new_level(var new_level_scene: PackedScene) -> Object:
	var _level := new_level_scene.instance()
	add_child(_level)
	_level.connect("end_of_level", self, "_on_level_ended")
	return _level

func update_score() -> void:
	_score += 1
	_hud.update_score(_score)

func _on_level_ended(var planet_destroyed: bool) -> void:
	if planet_destroyed:
		_show_end_screen("lose")
	else:
		_show_end_screen("win")

	

func _show_end_screen(var game_result: String) -> void:
	_hide_ui()
	
	_end_screen.update_score(_score)
	_end_screen.update_game_result(game_result)
	
	_end_screen.visible = true
	_current_level.queue_free()

func _show_start_screen() -> void:
	_hide_ui()
	_start_screen.visible = true

func _show_hud() -> void:
	_hide_ui()
	_hud.update_score(0)
	_hud.visible = true


func _show_about_screen() -> void:
	_hide_ui()
	_about_screen.visible = true
	
func _hide_ui() -> void:
	_hud.visible = false
	_end_screen.visible = false
	_start_screen.visible = false
	_about_screen.visible = false

func _on_EndScreen_play_again_selected():
	_score = 0
	var _level = _create_new_level(level)
	_current_level = _level
	_show_hud()


func _on_EndScreen_return_to_title_selected():
	_show_start_screen()


func _on_StartScreen_start_button_pressed():
	_score = 0
	var _level = _create_new_level(level)
	_current_level = _level
	_show_hud()

func _on_AboutScreen_return_to_title_selected():
	_about_screen.visible = false
	_show_start_screen()

func _on_StartScreen_about_button_pressed():
	_show_about_screen()
