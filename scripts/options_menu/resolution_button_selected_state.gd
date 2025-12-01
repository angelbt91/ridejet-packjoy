extends StateBase

@onready var global_state_machine: StateMachine = $".."
@onready var ui_hover_button: AudioStreamPlayer2D = $"../../UiHoverButton"
@onready var button: Button = $"../../ResolutionControl/ResolutionButton"
@onready var menu_arrow_left: TextureRect = $"../../MenuArrowLeft"
@onready var menu_arrow_right: TextureRect = $"../../MenuArrowRight"

const resolutions = {
	"800x600": Vector2i(800, 600),
	"1024x600": Vector2i(1024, 600),
	"1280x720": Vector2i(1280, 720),
	"1366x768": Vector2i(1366, 768),
	"1440x900": Vector2i(1440, 900),
	"1600x900": Vector2i(1600, 900),
	"1920x1080": Vector2i(1920, 1080),
	"2560x1440": Vector2i(2560, 1440),
	"3840x2160": Vector2i(3840, 2160),
}


func start() -> void:
	button.grab_focus()
	tween_arrow_to(button, menu_arrow_left, menu_arrow_right)


func end() -> void:
	button.button_pressed = false
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	ui_hover_button.play()
	button.release_focus()


func on_input() -> void:
	if Input.is_action_just_pressed("UI-Confirm"):
		_on_button_press()
	if Input.is_action_pressed("UI-Up"):
		state_machine.change_to("BackButtonSelectedState")
	if Input.is_action_pressed("UI-Down"):
		state_machine.change_to("WindowModeSelectedState")


func _on_button_press() -> void:
	menu_arrow_left.visible = false
	menu_arrow_right.visible = false
	ui_hover_button.play()
	button.mouse_filter = Control.MOUSE_FILTER_IGNORE # if hovering with mouse, ignore hover to show the button blue
	button.release_focus()
	button.button_pressed = true

	var resolution = choose_next_resolution()
	button.text = str(resolution.x, "x", resolution.y)
	get_window().set_size(resolution)


func choose_next_resolution() -> Vector2i:
	var res_keys = resolutions.keys()
	var current_res_key = str(get_window().size.x, "x", get_window().size.y)
	var current_res_index = res_keys.find(current_res_key)

	var next_res_key = res_keys[0] if current_res_index + 1 >= res_keys.size() else res_keys[current_res_index + 1]
	return resolutions[next_res_key]


func handle_mouse_hover() -> void:
	var is_animating = global_state_machine.current_state.name == "AnimatingInState"
	var is_already_in_state = global_state_machine.current_state.name == self.name
	if is_animating or is_already_in_state:
		return

	global_state_machine.change_to(self.name)


func tween_arrow_to(button_tw: Button, menu_arrow_left_tw: TextureRect, menu_arrow_right_tw: TextureRect) -> void:
	var button_rect = button_tw.get_global_rect()
	const MARGIN = 20

	var left_arrow_rect = menu_arrow_left_tw.get_global_rect()
	var left_x_position = button_rect.position.x - left_arrow_rect.size.x - MARGIN
	var left_y_position = button_rect.get_center().y - (left_arrow_rect.size.y / 2)
	var left_arrow_final_pos = Vector2(left_x_position, left_y_position)

	var right_arrow_rect = menu_arrow_right_tw.get_global_rect()
	var right_x_position = button_rect.position.x + button_rect.size.x + MARGIN
	var right_y_position = button_rect.get_center().y - (right_arrow_rect.size.y / 2)
	var right_arrow_final_pos = Vector2(right_x_position, right_y_position)

	var left_tween = create_tween()
	left_tween.tween_property(menu_arrow_left_tw, "position", left_arrow_final_pos, 0.05)

	var right_tween = create_tween()
	right_tween.tween_property(menu_arrow_right_tw, "position", right_arrow_final_pos, 0.05)


func _on_resolution_button_button_down() -> void:
	_on_button_press()


func _on_resolution_button_mouse_entered() -> void:
	handle_mouse_hover()
