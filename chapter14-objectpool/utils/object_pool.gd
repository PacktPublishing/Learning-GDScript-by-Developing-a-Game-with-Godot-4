class_name ObjectPool extends Object


var _pool: Array
var _root_node: Node
var _scene: PackedScene


func _init(scene: PackedScene, pool_size: int, root_node: Node):
	_scene = scene
	_root_node = root_node
	
	for _i in pool_size:
		_pool.append(create_new_node())


func kill_node(node: Node):
	_pool.append(node)


func get_dead_node() -> Node:
	var node: Node
	
	if not _pool.is_empty():
		node = _pool.pop_back()
	else:
		node = create_new_node()
	
	node.set_alive()
	return node


func create_new_node() -> Node:
	var new_node: Node = _scene.instantiate()
	_root_node.add_child(new_node, true)
	new_node.died.connect(kill_node.bind(new_node))
	return new_node


func free_nodes():
	for node in _pool:
		node.queue_free()
