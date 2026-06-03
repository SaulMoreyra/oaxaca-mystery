extends Node2D
## Level 1 flow: workshop → drying yard → boss gate (GDD G7).

const LEVEL_WIDTH: float = 3800.0
const POTS_REQUIRED: int = 3

@onready var _player: CharacterBody2D = $Entities/Player
@onready var _boss_gate: Node = $World/BossGate
@onready var _objective_label: Label = $UI/Hint/Label

var _pots_remaining: int = 0

func _ready() -> void:
	_setup_camera_limits()
	_connect_corrupted_pots()
	if _boss_gate.has_method("register_initial_pot_count"):
		_boss_gate.register_initial_pot_count(_pots_remaining)
	Events.checkpoint_reached.connect(_on_checkpoint_reached)
	Events.boss_gate_opened.connect(_on_boss_gate_opened)
	_update_objective_label()

func _setup_camera_limits() -> void:
	var camera := _player.get_node_or_null("Camera2D") as Camera2D
	if camera == null:
		return
	camera.limit_left = 0
	camera.limit_right = int(LEVEL_WIDTH)
	camera.limit_top = 0
	camera.limit_bottom = 1080
	camera.limit_smoothed = true

func _connect_corrupted_pots() -> void:
	_pots_remaining = 0
	for node in get_tree().get_nodes_in_group("corrupted_pot"):
		var health: Node = node.get_node_or_null("Health")
		if health == null or not health.has_signal("died"):
			continue
		_pots_remaining += 1
		health.died.connect(_on_pot_broken)

func _on_pot_broken() -> void:
	_pots_remaining = maxi(_pots_remaining - 1, 0)
	Events.corrupted_pot_destroyed.emit(_pots_remaining, POTS_REQUIRED)
	_update_objective_label()

func _on_checkpoint_reached(checkpoint_id: StringName) -> void:
	print("[Level01] checkpoint: ", checkpoint_id)

func _on_boss_gate_opened() -> void:
	_update_objective_label()

func _update_objective_label() -> void:
	if _objective_label == null:
		return
	if _pots_remaining > 0:
		_objective_label.text = (
			"Workshop → yard → break %d corrupted pots (rebozo) → boss arena | "
			% _pots_remaining
			+ "A/D move · SPACE jump · J/K attacks"
		)
	else:
		_objective_label.text = (
			"Gate open — enter the boss arena (right) | A/D move · SPACE jump · J/K attacks"
		)
