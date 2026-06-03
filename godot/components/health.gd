class_name Health
extends Node
## HP pool with optional invulnerability after taking damage (GDD G2: 0.8 s).

signal damaged(amount: int, remaining_hp: int)
signal died

@export var max_hp: int = 8
@export var invulnerability_duration: float = 0.8

var hp: int = 8
var _invuln_timer: float = 0.0

func _ready() -> void:
	hp = max_hp

func _process(delta: float) -> void:
	if _invuln_timer > 0.0:
		_invuln_timer -= delta

func take_damage(amount: int) -> bool:
	if amount <= 0 or hp <= 0:
		return false
	if _invuln_timer > 0.0:
		return false

	hp = maxi(hp - amount, 0)
	damaged.emit(amount, hp)

	if hp <= 0:
		died.emit()
		return true

	_invuln_timer = invulnerability_duration
	return true

func is_dead() -> bool:
	return hp <= 0

func heal_full() -> void:
	hp = max_hp
	_invuln_timer = 0.0
