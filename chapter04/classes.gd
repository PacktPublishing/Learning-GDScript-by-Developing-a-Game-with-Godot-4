extends Node2D


class Enemy: 
	var damage = 5 
	var health = 10 


	func take_damage(amount): 
		health -= amount 

		if health <= 0: 
			die() 


	func die(): 
		print("Aaargh I died!") 


class BuffEnemy extends Enemy: 
	func _init(): 
		health = 100 


	func die(): 
		print("How did you defeat me?!?")


func _ready():
	var enemy = Enemy.new()
	print(enemy.health)
	enemy.take_damage(3)
	print(enemy.health)
	enemy.take_damage(7)
	
	var buff_enemy = BuffEnemy.new()
	print(buff_enemy.health)
	buff_enemy.take_damage(30)
	print(buff_enemy.health)
	buff_enemy.take_damage(70)
