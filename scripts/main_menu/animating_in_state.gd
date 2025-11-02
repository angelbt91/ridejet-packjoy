extends StateBase

func on_finish_animation() -> void:
	state_machine.change_to("StartSelectedState")
