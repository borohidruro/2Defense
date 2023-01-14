#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>.

#Contact Info: carlosgarcia3dqro@gmail.com

class_name PlayerShip
extends PathFollow2D

var _movement_controls:= {"rotate_clockwise": "ui_left", 
						"rotate_counter_clockwise": "ui_right"}
var _movement_speed := 20

export var  ship_stats: Resource
export (Resource) var ship_controls

onready var _ship_sprite:= $Sprite


func _ready() -> void:
	_setup()
	
	
func _setup() -> void:
	_movement_controls.rotate_clockwise = ship_controls.rotate_clockwise
	_movement_controls.rotate_counter_clockwise = ship_controls.rotate_counter_clockwise
	_movement_speed = ship_stats.movement_speed
	

func _get_direction() -> float:
	return Input.get_action_strength(_movement_controls.rotate_counter_clockwise) - Input.get_action_strength(_movement_controls.rotate_clockwise)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var direction := _get_direction()
	offset += direction * _movement_speed
	

