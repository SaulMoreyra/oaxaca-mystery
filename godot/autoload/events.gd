extends Node
## Global event bus. Decouples HUD, audio, and spawns from entity scripts.

signal player_damaged(amount: int, remaining_hp: int)
signal enemy_died(enemy_type: StringName, world_position: Vector2)
signal checkpoint_reached(checkpoint_id: StringName)
signal boss_phase_changed(phase: int)
