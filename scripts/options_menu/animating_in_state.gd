extends StateBase

@onready var back_button_animation: AnimationPlayer = $"../../BackButtonControl/BackButtonAnimation"
@onready var back_button_button: Button = $"../../BackButtonControl/BackButtonButton"
@onready var resolution_animation: AnimationPlayer = $"../../ResolutionControl/ResolutionAnimation"
@onready var resolution_button: Button = $"../../ResolutionControl/ResolutionButton"
@onready var window_mode_animation: AnimationPlayer = $"../../WindowModeControl/WindowModeAnimation"
@onready var window_mode_button: Button = $"../../WindowModeControl/WindowModeButton"


func start() -> void:
	var items_to_animate = [
		{
			"animation": resolution_animation,
			"delay": 0,
		},
		{
			"animation": window_mode_animation,
			"delay": 0.2,
		},
		{
			"animation": back_button_animation,
			"delay": 0.2,
		},
	]
	for item in items_to_animate:
		await get_tree().create_timer(item.delay).timeout
		item.animation.active = true

	await back_button_animation.animation_finished

	back_button_button.disabled = false
	resolution_button.disabled = false
	window_mode_button.disabled = false

	state_machine.change_to("ResolutionButtonSelectedState")
