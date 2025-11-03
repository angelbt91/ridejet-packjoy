extends ButtonStateBase

@onready var options_button: Button = $"../../../OptionsButtonControl/OptionsButton"
@onready var menu_arrow_state_machine: StateMachine = $".."

func start() -> void:
	handle_button_focus_grab(options_button)
	
func end() -> void:
	handle_button_focus_release(options_button)
	
func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("CreditsSelectedState")

func _on_options_button_mouse_entered() -> void:
	handle_mouse_hover()
