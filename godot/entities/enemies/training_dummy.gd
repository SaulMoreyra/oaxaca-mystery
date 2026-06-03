extends StaticBody2D
## Combat test target. Takes player attacks and periodically strikes back for damage testing.

const STRIKE_RANGE: float = 140.0
const STRIKE_INTERVAL: float = 1.8
const STRIKE_ACTIVE_TIME: float = 0.2

@onready var _health: Health = $Health
@onready var _strike_hitbox: Hitbox = $StrikeHitbox
@onready var _strike_timer: Timer = $StrikeTimer

func _ready() -> void:
	_health.damaged.connect(_on_damaged)
	_health.died.connect(_on_died)
	_strike_timer.timeout.connect(_on_strike_timer)
	_strike_hitbox.disable()

func _on_strike_timer() -> void:
	var player := _find_player()
	if player == null:
		return
	if global_position.distance_to(player.global_position) > STRIKE_RANGE:
		return
	_pulse_strike()

func _pulse_strike() -> void:
	_strike_hitbox.enable()
	await get_tree().create_timer(STRIKE_ACTIVE_TIME).timeout
	_strike_hitbox.disable()

func _find_player() -> Node2D:
	return get_tree().get_first_node_in_group("player") as Node2D

func _on_damaged(amount: int, remaining: int) -> void:
	print("[TrainingDummy] -%d HP -> %d remaining" % [amount, remaining])
	modulate = Color(1.0, 0.5, 0.5)
	await get_tree().create_timer(0.1).timeout
	modulate = Color.WHITE

func _on_died() -> void:
	print("[TrainingDummy] defeated")
	Events.enemy_died.emit(&"training_dummy", global_position)
	_strike_timer.stop()
	queue_free()
