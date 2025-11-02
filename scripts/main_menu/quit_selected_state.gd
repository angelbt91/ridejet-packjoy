extends StateBase

@onready var quit_button: Button = $"../../../QuitButtonControl/QuitButton"

func start() -> void:
	quit_button.grab_focus()
	
func end() -> void:
	quit_button.release_focus()
	
func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("CreditsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Confirm"):
		quit_button.release_focus()
		quit_button.button_pressed = true
		await get_tree().create_timer(0.1).timeout # to have time to see the button as pressed
		get_tree().quit()
