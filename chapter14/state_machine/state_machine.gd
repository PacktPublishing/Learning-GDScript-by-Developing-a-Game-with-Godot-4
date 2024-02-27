class_name StateMachine extends Node


@export var starting_state: String


var states: Dictionary
var current_state: State


func _ready():
	for child in get_children():
		states[child.name] = child
		child.state_machine = self
	if not starting_state.is_empty():
		transition(starting_state)


func transition(state_name: String):
	if current_state:
		current_state.exit()
	
	current_state = states[state_name]
	current_state.enter()


func _physics_process(delta: float):
	if not current_state: return
	current_state.process(delta)
	
	
func _input(event: InputEvent):
	if not current_state: return
	current_state.input(event)
