extends StateBase

@onready var options_button: Button = $"../../../OptionsButtonControl/OptionsButton"

func start() -> void:
	options_button.grab_focus()
	
func end() -> void:
	options_button.release_focus()
	
func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("CreditsSelectedState")
