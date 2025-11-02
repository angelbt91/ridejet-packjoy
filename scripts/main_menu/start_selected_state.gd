extends StateBase

@onready var start_button: Button = $"../../../StartButtonControl/StartButton"

func start() -> void:
	start_button.grab_focus()
	
func end() -> void:
	start_button.release_focus()

func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("QuitSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("OptionsSelectedState")
