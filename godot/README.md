# Godot — Oaxaca Mystery (greybox prototype)

Godot 4 project with the skeleton of the vertical slice.

## Requirements

- [Godot 4.2+](https://godotengine.org/download) (standard branch; .NET is not required for this greybox).

## Open

1. Open Godot 4, click **Import**, and select `oaxaca-mystery/godot/project.godot`.
2. Let the editor finish importing assets (creates `.import` files under `assets/`). If the background fails to load, reimport `assets/escenario-taller-patio.png` (must be a real PNG, not JPEG renamed).
3. Press **Play** (F5). The main scene is `scenes/Level01_Atzompa.tscn`.

**If you see `Could not find type Hitbox/Health`:** pull the latest `fix/godot-load-errors` changes (circular script dependency fix).

## Controls (keyboard)

| Key | Action |
|-----|--------|
| A / D | Move |
| Space | Jump |
| J | Rebozo whip (melee) |
| K | Huarache throw (ranged) |

Combat deals real damage. The player has a heart HUD, i-frames (0.8s), knockback, and respawns at spawn. Stand near the training dummy to take periodic strike damage.

## Structure

```
godot/
  project.godot              # config + InputMap + physics layers
  icon.svg
  scenes/
    Player.tscn              # CharacterBody2D greybox (pink) + collision
    Level01_Atzompa.tscn     # real background + floor + camera + HUD hint
  scripts/
    player.gd                # platformer movement + 2 attacks (values from the GDD G2)
  assets/
    escenario-taller-patio.png
```

## Next (see ../docs/backlog.md)

- T2 Rebozo: frontal `Area2D` hitbox dealing 2 damage.
- T3 Huarache: `ProjectileHuarache` scene with an arc and 3 damage.
- T4 Jarrito Saltarín + glaze puddles.
- Level01 has parallax background, two checkpoints, three breakable corrupted pots, and a boss gate.
