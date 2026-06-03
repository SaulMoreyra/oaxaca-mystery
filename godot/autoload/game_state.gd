extends Node
## Session state for the vertical slice: player HP, checkpoints, level flow.

enum LevelState { EXPLORING, COMBAT, BOSS }

const DEFAULT_PLAYER_HP: int = 8

var player_max_hp: int = DEFAULT_PLAYER_HP
var player_hp: int = DEFAULT_PLAYER_HP
var last_checkpoint: Vector2 = Vector2.ZERO
var level_state: LevelState = LevelState.EXPLORING

func reset_player_health() -> void:
	player_hp = player_max_hp

func set_checkpoint(world_position: Vector2) -> void:
	last_checkpoint = world_position

func apply_player_damage(amount: int) -> void:
	player_hp = maxi(player_hp - amount, 0)
	Events.player_damaged.emit(amount, player_hp)

func is_player_dead() -> bool:
	return player_hp <= 0
