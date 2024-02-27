@tool
extends Node2D


class Enemy:
	var damage: float = 100.0
	var _damage_multiplier: float = 2.0


func _ready():
	var enemy: Enemy = Enemy.new()
	enemy.damaga = 150
