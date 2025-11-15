extends StateBase

@onready var credits_box_animation: AnimationPlayer = $"../../CreditsBoxControl/CreditsBoxAnimation"
@onready var back_button_animation: AnimationPlayer = $"../../BackButtonControl/BackButtonAnimation"
@onready var back_button: Button = $"../../BackButtonControl/BackButton"


func start() -> void:
	prints("Hola?")
	var items_to_animate = [
		{
			"animation": credits_box_animation,
			"delay": 0,
		},
		{
			"animation": back_button_animation,
			"delay": 0.2,
		},
	]
	for item in items_to_animate:
		prints("Hola!")
		await get_tree().create_timer(item.delay).timeout
		item.animation.active = true

	await back_button_animation.animation_finished

	back_button.disabled = false

	state_machine.change_to("BackButtonSelectedState")
