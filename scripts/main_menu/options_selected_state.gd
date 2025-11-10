extends ButtonStateBase

@onready var options_button: Button = $"../../OptionsButtonControl/OptionsButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"

func start() -> void:
	handle_button_focus_grab(options_button)
	tween_arrow_to(options_button, menu_arrow_left, menu_arrow_right)

func end() -> void:
	handle_button_focus_release(options_button)
	
func on_input() -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("CreditsSelectedState")

func _on_options_button_mouse_entered() -> void:
	handle_mouse_hover()
