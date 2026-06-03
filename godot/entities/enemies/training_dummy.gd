extends StaticBody2D
## Combat test target (GDD G6 placeholder). HP 8 so rebozo + huarache are easy to verify.

@onready var _health: Health = $Health

func _ready() -> void:
	_health.damaged.connect(_on_damaged)
	_health.died.connect(_on_died)

func _on_damaged(amount: int, remaining: int) -> void:
	print("[TrainingDummy] -%d HP -> %d remaining" % [amount, remaining])
	modulate = Color(1.0, 0.5, 0.5)
	await get_tree().create_timer(0.1).timeout
	modulate = Color.WHITE

func _on_died() -> void:
	print("[TrainingDummy] defeated")
	Events.enemy_died.emit(&"training_dummy", global_position)
	queue_free()
