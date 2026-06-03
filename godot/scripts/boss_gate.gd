extends StaticBody2D
## Blocks the boss arena until all corrupted pots in the level are destroyed.

@export var pots_required: int = 3

@onready var _collision: CollisionShape2D = $CollisionShape2D
@onready var _visual: ColorRect = $Visual
@onready var _label: Label = $Label

var _is_open: bool = false

func _ready() -> void:
	Events.corrupted_pot_destroyed.connect(_on_pot_destroyed)
	_refresh_label(pots_required)

func register_initial_pot_count(total: int) -> void:
	pots_required = total
	_refresh_label(total)

func _on_pot_destroyed(remaining: int, _required: int) -> void:
	_refresh_label(remaining)
	if remaining <= 0 and not _is_open:
		_open()

func _open() -> void:
	_is_open = true
	_collision.set_deferred("disabled", true)
	_visual.color = Color(0.2, 0.55, 0.35, 0.35)
	if _label != null:
		_label.text = "Boss arena — open"
	Events.boss_gate_opened.emit()

func _refresh_label(remaining: int) -> void:
	if _label == null:
		return
	if _is_open:
		return
	_label.text = "Break %d corrupted pots" % remaining
