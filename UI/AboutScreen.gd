#Copyright 2023 Carlos Esteban García Sánchez
#This file is part of 2Defender.

#2Defender is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

#2Defender is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with 2Defender. If not, see <https://www.gnu.org/licenses/>. 

#Contact Info: carlosgarcia3dqro@gmail.com

extends Control

signal return_to_title_selected

onready var _credits_screen := $CreditsScreen
onready var _copyright_screen := $CopyrightScreen
onready var _license_text_screen := $LicenseTextScreen


func _show_credits_screen() -> void:
	_hide_about_ui()
	_credits_screen.visible = true

func _show_copyright_screen() -> void:
	_hide_about_ui()
	_copyright_screen.visible = true

func _show_license_screen() -> void:
	_hide_about_ui()
	_license_text_screen.visible = true
	
func _hide_about_ui() -> void:
	_credits_screen.visible = false
	_copyright_screen.visible = false
	_license_text_screen.visible = false


func _on_Return_pressed():
	emit_signal("return_to_title_selected")

func _on_Credits_pressed():
	_show_credits_screen()

func _on_License_pressed():
	_show_license_screen()



func _on_CreditsScreen_return_to_about_screen():
	_show_copyright_screen()


func _on_LicenseTextScreen_return_to_about_screen():
	_show_copyright_screen()



