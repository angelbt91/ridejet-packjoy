extends StateBase

@onready var bg_music: AudioStreamPlayer = $"../../BgMusic"
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
	var items_to_animate = [
		{
			"animation": title_control_animation,
			"delay": 0.1,
		},
		{
			"animation": start_button_animation,
			"delay": 0.5,
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
		item.animation.active = true

	await quit_button_animation.animation_finished

	for button: Button in [start_button, options_button, credits_button, quit_button]:
		button.disabled = false

	state_machine.change_to("StartSelectedState")
