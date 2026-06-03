# Godot Implementation Plan — Vertical Slice

Ordered phases to avoid rework. **Phase 0 must land before combat features.**

## Status

| Phase | Scope | Status |
|-------|--------|--------|
| 0 | Damage architecture (autoloads + components) | Done |
| 1 | Combat loop (rebozo, huarache, training dummy) | Done |
| 2 | Player health + HUD + i-frames | Pending |
| 3 | Playable Level01 (parallax, checkpoints) | Pending |
| 4 | Enemies (Jarrito, Guardián, Ofrenda, Pez) | Pending |
| 5 | Boss (2 phases) | Pending |
| 6 | VFX, juice, audio | Pending |
| 7 | Touch controls + mobile builds | Pending |

## Phase 0 — Foundation

- `autoload/Events.gd` — global signal bus
- `autoload/GameState.gd` — HP, checkpoints, level state
- `autoload/AudioManager.gd` — SFX/music stub
- `components/Health.gd` — HP, i-frames, `damaged` / `died`
- `components/Hitbox.gd` — deals damage to opposing `Hurtbox`
- `components/Hurtbox.gd` — forwards hits to parent `Health`

Physics layers: `hurtbox` (5), `hitbox` (6) in addition to world/player/enemy/projectile.

## Phase 1 — Combat loop

- Player rebozo `Hitbox` (2 dmg, brief active window)
- `ProjectileHuarache` (3 dmg, arc, cooldown 1.5 s)
- `TrainingDummy` enemy with `Health` + `Hurtbox` for testing

## Critical path

```
Phase 0 → Phase 1 → Phase 2 → Phase 3 → Phase 4 → Phase 5 → Phase 6 → Phase 7
```

See also `docs/backlog.md` for ticket IDs T0–T9.
