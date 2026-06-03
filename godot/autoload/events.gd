extends Node
## Global event bus. Decouples HUD, audio, and spawns from entity scripts.

signal player_damaged(amount: int, remaining_hp: int)
signal enemy_died(enemy_type: StringName, world_position: Vector2)
signal checkpoint_reached(checkpoint_id: StringName)
signal corrupted_pot_destroyed(remaining: int, required: int)
signal boss_gate_opened
signal boss_phase_changed(phase: int)
