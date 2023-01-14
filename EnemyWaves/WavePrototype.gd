#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

class_name WavePrototype
extends Node2D

onready var _enemies := $Enemies
signal finished

func _ready() -> void:
	setup_enemies()

func setup_enemies() -> void:
	for _enemy in _enemies.get_children():
		_enemy.look_at(EventBusAndConstants.PLANETPOSITION)
		_enemy.connect("tree_exited", self, "_on_Enemy_tree_exited")
		
		
func _on_Enemy_tree_exited() -> void:
	if is_wave_finished():
		emit_signal("finished")
		queue_free()

func is_wave_finished() -> bool:
	return _enemies.get_child_count() < 1
