#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

class_name Level
extends Node2D

signal end_of_level

onready var _events_player := $EventsPlayer
onready var _enemy_wave_manager := $EnemyWaveManager

var _planet_was_destroyed: bool = false

func _ready() -> void:
	_start()

func _start() -> void:
	_events_player.play_current_event()

func _play_next_event() -> void:
	_events_player.play_current_event()


func _on_EnemyWaveManager_wave_finished():
	_play_next_event()



func _on_MusicPlayer_finished():
	_play_next_event()


func _on_EventsPlayer_events_finished():
	if _planet_was_destroyed:
		return
	else:
		emit_signal("end_of_level", _planet_was_destroyed)


func _on_Planet_planet_destroyed():
	_planet_was_destroyed = true


func _on_Planet_planet_explosion_animation_finished():
	emit_signal("end_of_level", _planet_was_destroyed)
