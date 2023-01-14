#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

class_name Projectile
extends RigidBody2D


const MAX_DISTANCE := 900.0 

var _origin: Vector2 = Vector2.ZERO
var damage := 1

func _ready() -> void:
	_origin = position




func _process(_delta: float) -> void:
	if position.distance_to(_origin) > MAX_DISTANCE:
		queue_free()
