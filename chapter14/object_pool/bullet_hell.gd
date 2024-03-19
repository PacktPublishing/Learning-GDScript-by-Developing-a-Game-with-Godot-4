extends Node2D


const ARROW_SCENE: PackedScene = preload("res://object_pool/arrow.tscn")

@onready var _spawn_position = $SpawnPosition

var _arrow_pool: ObjectPool = ObjectPool.new(ARROW_SCENE, 200, self)


func _process(_delta):
	var arrow: Arrow = _arrow_pool.get_dead_node()
	if arrow:
		arrow.position = _spawn_position.position


func _exit_tree():
	_arrow_pool.free_nodes()
	_arrow_pool.free()
