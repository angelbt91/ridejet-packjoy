extends ButtonStateBase

@onready var button: Button = $"../../QuitButtonControl/QuitButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"


func start() -> void:
	handle_button_focus_grab(button)
	tween_arrow_to(button, menu_arrow_left, menu_arrow_right)


func end() -> void:
	handle_button_focus_release(button)


func on_input() -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("CreditsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Confirm"):
		ui_hover_button.play()
		button.release_focus()
		button.button_pressed = true
		await get_tree().create_timer(0.2).timeout # to have time to see the button as pressed
		get_tree().quit()


func _on_quit_button_mouse_entered() -> void:
	handle_mouse_hover()
