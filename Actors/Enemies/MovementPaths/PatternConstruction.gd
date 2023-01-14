#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

tool
extends Path2D

const _path_linear_length = 1150

export (String, "linear", "sinusoidal") var curve_type:= "sinusoidal"

export var total_points:= 20

export var amplitude := 200.0
export var frecuency := 1.0
var _linear_path_curve : Curve2D = preload("res://Actors/Enemies/MovementPaths/PathLine.tres")
var _sinusoidal_path_curve : Curve2D = preload("res://Actors/Enemies/MovementPaths/PathSine.tres")

func _ready() -> void:
	var _point_x: float = 0.0
	var _point_y: float = 0.0
	
	match curve_type:
		"linear":
			curve = _linear_path_curve
			curve.clear_points()
			curve.add_point(Vector2(0,0))
			curve.add_point(Vector2(_path_linear_length, 0))
		
		"sinusoidal":
			curve = _sinusoidal_path_curve
			curve.clear_points()
			var _normalized_point_number: float = 0.0
			
			for point_number in range(total_points + 1):
				_normalized_point_number = point_number/float(total_points)
				
				_point_x = (_normalized_point_number) * _path_linear_length
				_point_y = sin(2.0 * PI * _normalized_point_number * frecuency) * amplitude
				
				curve.add_point(Vector2(_point_x, _point_y))
			
			
