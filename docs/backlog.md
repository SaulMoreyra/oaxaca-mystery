# Backlog — Vertical Slice (implementation order)

> Derived from appendix T7 of the deck. Tickets ordered by dependency: each one assumes the previous is done. Estimates in relative points (S=1, M=3, L=5).

## Legend
- **DoD** = Definition of Done (acceptance criteria).
- Initial status: `TODO`. Mark `DOING` / `DONE` as you progress.

---

### T0 — Godot project setup · [DONE] · S
- Godot 4 project, InputMap, physics layers, main scene.
- **DoD:** the project opens and runs `Level01_Atzompa.tscn` without errors.
- *Delivered in `godot/`.*

### T1 — Player movement + platforming · [DONE] · M
- CharacterBody2D with walk, jump, gravity, coyote time, jump buffer.
- **DoD:** the Maestra moves and jumps over the greybox floor with responsive feel.
- *Base delivered in `scripts/player.gd`; calibrate values in playtest.*

### T2 — Rebozo whip (melee) · [TODO] · M
- Frontal hitbox `Area2D` triggered by `attack_rebozo`, 2 damage (G2), active window ~2 frames.
- Placeholder VFX (sparkle). No cancellation.
- **DoD:** hitting destroys a test pot and applies damage to a dummy.
- *Depends on T1.*

### T3 — Huarache throw (projectile) · [TODO] · M
- `ProjectileHuarache` scene (Area2D + arcing movement), 3 damage, 1.5 s cooldown, despawn on impact/edge.
- **DoD:** throwing via `attack_huarache` hits a dummy at range and respects the cooldown.
- *Depends on T1.*

### T4 — Jarrito Saltarín + glaze puddles · [TODO] · L
- Basic enemy: HP 2, hops toward the player; on death leaves a puddle that slows 50% / 2 s.
- **DoD:** the Jarrito chases, dies from 1 rebozo hit, and its puddle slows the Maestra.
- *Depends on T2.*

### T5 — Playable greybox level (Level01) · [TODO] · L
- Block layout: workshop entrance -> yard -> arena door. Checkpoints (2). Real background as a split `ParallaxBackground`.
- **DoD:** the level can be traversed from start to the boss door with Jarritos along the way.
- *Depends on T1, T4.*

### T6 — Remaining enemies · [TODO] · L
- Guardián de Dos Caras (HP 8, tongue/spin), Ofrenda Flotante (HP 4, projectiles), Pez Pochote (HP 5, charge). Base class `EnemyBase`.
- **DoD:** all 3 work with their key attack and take damage from rebozo and huarache.
- *Depends on T2, T3.*

### T7 — Boss Great Serpent (2 phases) · [TODO] · L
- Phase 1: pot -> serpent (skippable transformation). Phase 2: bite, spike burst, vulnerable window (pink core). HP 40, health bar.
- **DoD:** full fight from start to defeat with both phases and the vulnerable window.
- *Depends on T6.*

### T8 — Art swap + glaze VFX · [TODO] · L
- Replace greybox with game-ready sprites (split the concept). Particles: glaze splash, huarache trail, boss aura/core. HUD (hearts + boss bar) and touch buttons.
- **DoD:** the slice looks final, not greybox; HUD legible on mobile.
- *Depends on T5, T7.*

### T9 — Mobile builds (iOS / Android) · [TODO] · M
- Android export (AAB/APK internal testing) and iOS (TestFlight). Adjust safe areas and performance (60 FPS mid-range).
- **DoD:** installable build on a physical device of each platform.
- *Depends on T8.*

---

## Critical path

```
T1 ─┬─▶ T2 ─┬─▶ T4 ─▶ T5 ─┐
    └─▶ T3 ─┘             ├─▶ T6 ─▶ T7 ─▶ T8 ─▶ T9

```

## Audio (parallel, non-blocking)
- SFX: rebozo, huarache, splash, impact, boss roar, transformation.
- Music: 1 yard loop + 1 combat/boss loop.
