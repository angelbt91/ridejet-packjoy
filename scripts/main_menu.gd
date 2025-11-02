extends Node2D

@onready var title_control_animation: AnimationPlayer = $TitleControl/TitleControlAnimation
@onready var start_button_animation: AnimationPlayer = $StartButtonControl/StartButtonAnimation
@onready var options_button_animation: AnimationPlayer = $OptionsButtonControl/OptionsButtonAnimation
@onready var credits_button_animation: AnimationPlayer = $CreditsButtonControl/CreditsButtonAnimation
@onready var quit_button_animation: AnimationPlayer = $QuitButtonControl/QuitButtonAnimation

func _ready() -> void:
	$BgMusic.play()
	animate_menu_enter()

func animate_menu_enter() -> void:
	var items_to_animate = [{
		"animation": title_control_animation,
		"delay": 0.1
	}, {
		"animation": start_button_animation,
		"delay": 0.5
	}, {
		"animation": options_button_animation,
		"delay": 0.2
	}, {
		"animation": credits_button_animation,
		"delay": 0.2
	}, {
		"animation": quit_button_animation,
		"delay": 0.2
	}]
	for item in items_to_animate:
		await get_tree().create_timer(item.delay).timeout
		item.animation.active = true
	
	
	
