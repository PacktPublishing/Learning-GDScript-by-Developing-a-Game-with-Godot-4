class_name ObjectPool extends Node


var _pool: Array


func _init(scene: PackedScene, pool_size: int, root_node: Node):
	for _i in pool_size:
		var new_node: Node = scene.instantiate()
		_pool.append(new_node)
		new_node.died.connect(kill_node.bind(new_node))
		root_node.add_child(new_node)


func kill_node(node: Node):
	node.kill()
	_pool.append(node)


func get_dead_node() -> Node:
	if _pool.is_empty():
		return null
	var node: Node = _pool.pop_back()
	node.set_alive()
	return node
