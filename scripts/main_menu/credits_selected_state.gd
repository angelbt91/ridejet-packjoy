extends StateBase

@onready var credits_button: Button = $"../../../CreditsButtonControl/CreditsButton"

func start() -> void:
	credits_button.grab_focus()
	
func end() -> void:
	credits_button.release_focus()
	
func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("OptionsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("QuitSelectedState")
