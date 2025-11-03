class_name ButtonStateBase extends StateBase

@onready var global_state_machine: StateMachine = $"../../MenuArrowStateMachine"
@onready var ui_hover_button: AudioStreamPlayer2D = $"../../../UiHoverButton"

func handle_button_focus_grab(button: Button) -> void:
	button.grab_focus()
	
func handle_button_focus_release(button: Button) -> void:
	ui_hover_button.play()
	button.release_focus()

func handle_mouse_hover() -> void:
	var is_animating = global_state_machine.current_state.name == "AnimatingInState"
	var is_already_in_state = global_state_machine.current_state.name == self.name
	if is_animating or is_already_in_state:
		return

	global_state_machine.change_to(self.name)
