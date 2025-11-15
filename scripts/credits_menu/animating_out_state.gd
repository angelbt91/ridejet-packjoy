extends StateBase

@onready var credits_box_animation: AnimationPlayer = $"../../CreditsBoxControl/CreditsBoxAnimation"
@onready var back_button_animation: AnimationPlayer = $"../../BackButtonControl/BackButtonAnimation"


func start() -> void:
	var items_to_animate = [
		{
			"animation": back_button_animation,
			"delay": 0.0,
		},
		{
			"animation": credits_box_animation,
			"delay": 0.2,
		},
	]
	for item in items_to_animate:
		await get_tree().create_timer(item.delay).timeout
		item.animation.play_backwards()

	await credits_box_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
