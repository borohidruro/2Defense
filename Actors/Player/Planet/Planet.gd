#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

extends Node2D

signal planet_destroyed
signal planet_explosion_animation_finished


export var max_health:= 0

var health := 0

onready var _texture_progress_bar := $TextureProgress
onready var _animation_player := $AnimationPlayer

func _ready():
	health = max_health
	_texture_progress_bar.max_value = max_health
	_texture_progress_bar.value = max_health

func _on_Area2D_area_entered(enemy_hitbox: HitBoxArea2D):
	
	var _enemy := enemy_hitbox.owner
	_enemy.invade_planet()
	yield(_enemy, "invasion_completed")
	
	health -= enemy_hitbox.damage
	_texture_progress_bar.value = health
	if health <= 0:
		_animation_player.play("01-planet_explosion")
		emit_signal("planet_destroyed")
		yield(_animation_player, "animation_finished")
		emit_signal("planet_explosion_animation_finished")
