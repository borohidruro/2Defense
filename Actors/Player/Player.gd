#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

tool
extends Path2D

const Projectile:= preload("res://Weapons/Bullets/Projectile.tscn")
onready var _cooldown_timer_ship_1 = $CoolDownShip1
onready var _cooldown_timer_ship_2 = $CoolDownShip2
onready var _ship_1 = $Ship1
onready var _ship_2 = $Ship2

func _ready() -> void:
	_cooldown_timer_ship_1.connect("timeout", self, "_on_CoolDownShip1_timeout", [_ship_1])
	_cooldown_timer_ship_2.connect("timeout", self, "_on_CoolDownShip2_timeout", [_ship_2])


func _fire(var shooting_ship: PlayerShip) -> void:
	var _shooting_ship := shooting_ship
	var projectile: RigidBody2D = Projectile.instance()
	projectile.position = _shooting_ship.position
	projectile.rotate(_shooting_ship.rotation)
	projectile.linear_velocity = projectile.linear_velocity.rotated(_shooting_ship.global_rotation)
	add_child(projectile)
	


func _on_CoolDownShip1_timeout(var shooting_ship: PlayerShip):
	_fire(shooting_ship)

func _on_CoolDownShip2_timeout(var shooting_ship: PlayerShip):
	_fire(shooting_ship)
