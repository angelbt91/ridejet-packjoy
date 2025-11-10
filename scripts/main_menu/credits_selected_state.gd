extends ButtonStateBase

@onready var credits_button: Button = $"../../CreditsButtonControl/CreditsButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"

func start() -> void:
	handle_button_focus_grab(credits_button)
	tween_arrow_to(credits_button, menu_arrow_left, menu_arrow_right)
	
func end() -> void:
	handle_button_focus_release(credits_button)
	
func on_input() -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("OptionsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("QuitSelectedState")

func _on_credits_button_mouse_entered() -> void:
	handle_mouse_hover()
