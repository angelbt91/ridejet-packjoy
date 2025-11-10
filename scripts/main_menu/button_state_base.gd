class_name ButtonStateBase extends StateBase

@onready var global_state_machine: StateMachine = $"../../MenuArrowStateMachine"
@onready var ui_hover_button: AudioStreamPlayer2D = $"../../UiHoverButton"

func handle_button_focus_grab(button: Button) -> void:
	button.grab_focus()
	
func handle_button_focus_release(button: Button) -> void:
	ui_hover_button.play()
	button.release_focus()

func handle_mouse_hover() -> void:
	var is_animating = global_state_machine.current_state.name == "AnimatingInState"
	var is_already_in_state = global_state_machine.current_state.name == self.name
	if is_animating or is_already_in_state:
		return

	global_state_machine.change_to(self.name)

func tween_arrow_to(button: Button, menu_arrow_left: TextureRect, menu_arrow_right: TextureRect) -> void:
	var button_rect = button.get_global_rect()
	const MARGIN = 20
	
	var left_arrow_rect = menu_arrow_left.get_global_rect()
	var left_x_position = button_rect.position.x - left_arrow_rect.size.x - MARGIN
	var left_y_position = button_rect.get_center().y - (left_arrow_rect.size.y / 2)
	var left_arrow_final_pos = Vector2(left_x_position, left_y_position)
	
	var right_arrow_rect = menu_arrow_right.get_global_rect()
	var right_x_position = button_rect.position.x + button_rect.size.x + MARGIN
	var right_y_position = button_rect.get_center().y - (right_arrow_rect.size.y / 2)
	var right_arrow_final_pos = Vector2(right_x_position, right_y_position)
	
	var left_tween = create_tween()
	left_tween.tween_property(menu_arrow_left, "position", left_arrow_final_pos, 0.05)
	
	var right_tween = create_tween()
	right_tween.tween_property(menu_arrow_right, "position", right_arrow_final_pos, 0.05)
