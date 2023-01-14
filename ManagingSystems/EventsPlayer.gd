#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

extends AnimationPlayer

signal events_finished
export var current_event := 0

func play_event(event_index := current_event) -> void:
	var events_list: Array = get_animation_list()
	var animation_count := events_list.size()
	if event_index >= animation_count:
		emit_signal("events_finished")
		return
	play(events_list[event_index])

func play_current_event() -> void:
	play_event(current_event)
	current_event += 1
