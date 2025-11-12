extends ButtonStateBase

@onready var button: Button = $"../../CreditsButtonControl/CreditsButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"


func start() -> void:
	handle_button_focus_grab(button)
	tween_arrow_to(button, menu_arrow_left, menu_arrow_right)


func end() -> void:
	handle_button_focus_release(button)


func on_input() -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("OptionsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("QuitSelectedState")
	if Input.is_action_pressed("UI-Confirm"):
		_on_button_press()


func _on_button_press() -> void:
	menu_arrow_left.visible = false
	menu_arrow_right.visible = false
	state_machine.clicked_option = state_machine.CLICKABLE_MENU_OPTIONS.CREDITS
	ui_hover_button.play()
	button.mouse_filter = Control.MOUSE_FILTER_IGNORE # if hovering with mouse, ignore hover to show the button blue
	button.release_focus()
	button.button_pressed = true
	state_machine.change_to("AnimatingOutState")


func _on_credits_button_mouse_entered() -> void:
	handle_mouse_hover()


func _on_credits_button_button_down() -> void:
	_on_button_press()
