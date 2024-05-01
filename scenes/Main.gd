extends Node2D

@onready var slot = $Control/SubViewportContainer/SubViewport/SlotMachine

func _ready():
	slot.connect("stopped", Callable(self, "_on_slot_machine_stopped"))

func _on_Roll_button_down():
	if $Roll.text == "Roll":
		slot.start()
		$Roll.text = "Stop"
	else:
		slot.stop()
		
func _on_slot_machine_stopped():
	$Roll.text = "Roll"
