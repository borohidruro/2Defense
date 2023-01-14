#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

tool
extends Node
export var wave_scene: PackedScene

signal wave_finished

func spawn_wave() -> void:
	var _wave:Node2D = wave_scene.instance()
# warning-ignore:return_value_discarded
	_wave.connect("finished", self, "_on_wave_finished")
	add_child(_wave)
	_wave.set_as_toplevel(true)
	

func _on_wave_finished() -> void:
	emit_signal("wave_finished")

	
