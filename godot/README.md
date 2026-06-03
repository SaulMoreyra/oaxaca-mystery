# Godot — Oaxaca Mystery (greybox prototype)

Godot 4 project with the skeleton of the vertical slice.

## Requirements

- [Godot 4.2+](https://godotengine.org/download) (standard branch; .NET is not required for this greybox).

## Open

1. Open Godot 4, click **Import**, and select `oaxaca-mystery/godot/project.godot`.
2. Godot will finish importing the background texture and assign UIDs automatically the first time.
3. Press **Play** (F5). The main scene is `scenes/Level01_Atzompa.tscn`.

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
