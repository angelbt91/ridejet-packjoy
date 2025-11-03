extends ButtonStateBase

@onready var start_button: Button = $"../../../StartButtonControl/StartButton"

func start() -> void:
	handle_button_focus_grab(start_button)
	
func end() -> void:
	handle_button_focus_release(start_button)

func on_input(event: InputEvent) -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("QuitSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("OptionsSelectedState")

func _on_start_button_mouse_entered() -> void:
	handle_mouse_hover()
