class_name StateMachine
extends Node

@onready var controlled_node: Node = self.get_parent()
@export var default_state: StateBase
var current_state: StateBase = null
# TODO move this out from the state_machine.gd, as they are specific only for MainMenu
enum CLICKABLE_MENU_OPTIONS { START, OPTIONS, CREDITS }
var clicked_option: CLICKABLE_MENU_OPTIONS


func _ready():
	call_deferred("_start_default_state")


func _start_default_state() -> void:
	current_state = default_state
	_state_start()


func _state_start() -> void:
	prints("SM:", controlled_node.name, "->", current_state.name)
	current_state.controlled_node = controlled_node
	current_state.state_machine = self

	if current_state and current_state.has_method("start"):
		current_state.start()


func change_to(new_state: String) -> void:
	if current_state and current_state.has_method("end"):
		current_state.end()

	current_state = get_node(new_state)
	_state_start()


func _input(_event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input()
