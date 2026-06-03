extends Area2D
## Saves respawn position when the player enters (GDD G7).

@export var checkpoint_id: StringName = &"checkpoint"

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	GameState.set_checkpoint(global_position)
	Events.checkpoint_reached.emit(checkpoint_id)
