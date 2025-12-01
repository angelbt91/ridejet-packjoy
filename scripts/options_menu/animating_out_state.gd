extends StateBase

@onready var back_button_animation: AnimationPlayer = $"../../BackButtonControl/BackButtonAnimation"
@onready var resolution_animation: AnimationPlayer = $"../../ResolutionControl/ResolutionAnimation"
@onready var window_mode_animation: AnimationPlayer = $"../../WindowModeControl/WindowModeAnimation"


func start() -> void:
	var items_to_animate = [
		{
			"animation": back_button_animation,
			"delay": 0.2,
		},
		{
			"animation": window_mode_animation,
			"delay": 0.2,
		},
		{
			"animation": resolution_animation,
			"delay": 0,
		},
	]
	for item in items_to_animate:
		await get_tree().create_timer(item.delay).timeout
		item.animation.play_backwards()

	await resolution_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
