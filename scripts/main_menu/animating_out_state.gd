extends ButtonStateBase

@onready var title_control_animation: AnimationPlayer = $"../../TitleControl/TitleControlAnimation"
@onready var start_button: Button = $"../../StartButtonControl/StartButton"
@onready var start_button_animation: AnimationPlayer = $"../../StartButtonControl/StartButtonAnimation"
@onready var options_button: Button = $"../../OptionsButtonControl/OptionsButton"
@onready var options_button_animation: AnimationPlayer = $"../../OptionsButtonControl/OptionsButtonAnimation"
@onready var credits_button: Button = $"../../CreditsButtonControl/CreditsButton"
@onready var credits_button_animation: AnimationPlayer = $"../../CreditsButtonControl/CreditsButtonAnimation"
@onready var quit_button: Button = $"../../QuitButtonControl/QuitButton"
@onready var quit_button_animation: AnimationPlayer = $"../../QuitButtonControl/QuitButtonAnimation"


func start() -> void:
	disable_not_clicked_buttons()

	var items_to_animate = [
		{
			"animation": title_control_animation,
			"delay": 0.0,
		},
		{
			"animation": start_button_animation,
			"delay": 0.2,
		},
		{
			"animation": options_button_animation,
			"delay": 0.2,
		},
		{
			"animation": credits_button_animation,
			"delay": 0.2,
		},
		{
			"animation": quit_button_animation,
			"delay": 0.2,
		},
	]
	for item in items_to_animate:
		await get_tree().create_timer(item.delay).timeout
		item.animation.play_backwards()

	await quit_button_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/credits_menu.tscn")


func disable_not_clicked_buttons() -> void:
	var buttons_to_option = {
		state_machine.CLICKABLE_MENU_OPTIONS.START: start_button,
		state_machine.CLICKABLE_MENU_OPTIONS.OPTIONS: options_button,
		state_machine.CLICKABLE_MENU_OPTIONS.CREDITS: credits_button,
	}
	var clicked_button = buttons_to_option[state_machine.clicked_option]
	for button: Button in [start_button, options_button, credits_button, quit_button]:
		if clicked_button != button:
			button.disabled = true
