extends ButtonStateBase

@onready var quit_button: Button = $"../../QuitButtonControl/QuitButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"

func start() -> void:
	handle_button_focus_grab(quit_button)
	tween_arrow_to(quit_button, menu_arrow_left, menu_arrow_right)
	
func end() -> void:
	handle_button_focus_release(quit_button)
	
func on_input() -> void:
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("CreditsSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("StartSelectedState")
	if Input.is_action_pressed("UI-Confirm"):
		ui_hover_button.play()
		quit_button.release_focus()
		quit_button.button_pressed = true
		await get_tree().create_timer(0.1).timeout # to have time to see the button as pressed
		get_tree().quit()

func _on_quit_button_mouse_entered() -> void:
	handle_mouse_hover()
