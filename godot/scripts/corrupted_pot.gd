extends StaticBody2D
## Breakable corrupted clay pot — counts toward opening the boss gate (GDD G7).

@onready var _health: Health = $Health

func _ready() -> void:
	add_to_group("corrupted_pot")
	_health.died.connect(_on_destroyed)

func _on_destroyed() -> void:
	queue_free()
