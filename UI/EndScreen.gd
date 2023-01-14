#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

extends Control

signal play_again_selected
signal return_to_title_selected

const GAME_RESULT_MESSAGE := {"win": "You stopped the invasion!", "lose": "Sorry, you failed"}

onready var _game_result_label:= $MarginContainer/CenterContainer/VBoxContainer2/GameResult
onready var _score_label := $MarginContainer/CenterContainer/VBoxContainer2/HBoxContainer/Score

func update_game_result(_game_result: String) -> void:
	assert(GAME_RESULT_MESSAGE.has(_game_result) ,"invalid string for _game_result" )
	_game_result_label.text = GAME_RESULT_MESSAGE[_game_result]

func update_score(var final_score: int) -> void:
	_score_label.text = str(final_score)
	


func _on_Play_Again_pressed():
	emit_signal("play_again_selected")


func _on_StartScreen_pressed():
	emit_signal("return_to_title_selected")
