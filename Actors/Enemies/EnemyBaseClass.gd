#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

class_name Enemy
extends Node2D


signal enemy_died
signal invasion_completed

var _movement_speed := 1.0

export var enemy_stats: Resource

onready var _enemy_path := $EnemyPath
onready var _enemy_unit := $EnemyPath/EnemyUnit
onready var _tween := $Tween
onready var _animation_player := $AnimationPlayer
onready var _hitbox := $EnemyPath/EnemyUnit/HitBoxArea2D
onready var _hurtbox := $EnemyPath/EnemyUnit/HurtBoxArea2D

func _ready() -> void:
	setup_enemy()
	_move()


func setup_enemy() -> void:
	_movement_speed = enemy_stats.movement_speed
	


func _move() -> void:
	
	var _tween_duration = 10.0 /_movement_speed 
	
	_tween.interpolate_property(_enemy_unit, "unit_offset",
		0.0, 1.0, _tween_duration,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		
	_tween.start()

func invade_planet() -> void:
	_hitbox.set_deferred("monitorable", false)
	_hurtbox.set_deferred("monitoring", false)
	_animation_player.play("Invasion")
	

func _on_HurtBoxArea2D_hit_landed(_damage):
	_hitbox.set_deferred("monitorable", false)
	_hurtbox.set_deferred("monitoring", false)
	_tween.stop_all()
	emit_signal("enemy_died")
	EventBusAndConstants.emit_signal("score_increased")
	_animation_player.play("Explosion")
	



