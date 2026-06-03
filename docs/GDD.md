# GDD — Oaxaca Mystery (Vertical Slice)

> Game Design Document for the vertical slice. Status: draft v0.1. Platforms: iOS / Android.
> Genre: 2D action, platforming and combat (side-scroller). Engine: Godot 4.

---

## 1. Overview

A master potter (La Maestra Alfarera) from Santa María Atzompa fights clay pieces corrupted by a mystical energy, using her rebozo (melee) and her huarache (ranged). The vertical slice covers **one full level**: workshop + drying yard, 4 enemy types, and the boss Great Clay Serpent (Gran Serpiente de Barro Pochote) across 2 phases.

**Design pillars**

1. Legible artisanal combat (2 attacks, clear readability on mobile).
2. Woodcut/Posada visual identity + neon glazed clay.
3. Enemies whose behavior derives from their material (clay, glaze, spikes).

---

## G1 — Controls (mobile)

| Input | Action |
|-------|--------|
| Left virtual stick | Move (walk left/right) |
| Button A (right) | Jump / interact with NPC |
| Button B | Rebozo whip (melee) |
| Button C | Throw huarache (ranged) |

- **Layout:** semi-transparent touch controls respecting iOS/Android *safe areas* (notch + home indicator).
- **Bluetooth gamepad:** *nice-to-have* post-slice (map A=jump, X=rebozo, Y=huarache).
- **Accessibility:** large buttons (>= 48dp), configurable stick dead zone.

---

## G2 — Vertical slice systems

> **Placeholder** values: calibrated during the greybox prototype. Documented so dev and design start from the same number.

| System | Value v0.1 | Notes |
|--------|------------|-------|
| Player health | 4 hearts (8 halves) | Each enemy hit = 1 half or 1 heart depending on source |
| Rebozo damage | 2 | 1-hit the Jarrito; staggers the Guardián |
| Huarache damage | 3 | Cooldown 1.5 s; infinite ammo in slice |
| Huarache cooldown | 1.5 s | No ammo or pickup in slice |
| Glaze on the ground | 50% slow for 2 s | Puddle dropped by the Jarrito on death |
| i-frames after a hit | 0.8 s | Sprite blink |
| Knockback to the player | 120 px horizontal | Away from the source |
| Checkpoints | 2 | Before the yard and before the boss |
| Lives / retries | Infinite in slice | Respawn at last checkpoint |

---

## G3 — Movement and platforming

- Walk, jump and fall. **No dash** in the slice.
- **Coyote time:** 0.1 s (optional, improves feel).
- **Jump buffer:** 0.12 s.
- Jump height: ~2.5 tiles; allows climbing adobe platforms without pixel precision.
- **Platforms:** irregular adobe with clearly outlined *ledges* (readability on small screens).
- No climbable walls or wall-jump in the slice.

---

## G4 — Card: Rebozo whip (melee)

- **Type:** frontal short-to-medium range strike (arc toward the front).
- **Frames (concept reference `assets/concept/maestra-rebozo.png`):**
  - Access/unwrap: 5 frames
  - Strike/swing: 5 frames (the impact frame defines the hitbox)
  - Recovery/re-wrap: 4 frames
- **Active hitbox:** ~2 central frames of the strike.
- **VFX:** pink/orange sparkles along the arc.
- **Cancellation:** not cancelable in the slice (simplicity).
- **Design use:** break pots, 1-hit the Jarrito, stagger heavy melee.

---

## G5 — Card: Huarache throw (ranged)

- **Type:** arcing projectile toward the front.
- **Frames (reference `assets/concept/maestra-huarache.png`):** wind-up (cross-arm) -> release -> recover; 5 frames + 3 visualization panels.
- **Projectile:** bright trail; *despawns* on impact or when leaving the screen.
- **Recovery:** the huarache "returns" magically — there is no pickup in the slice.
- **Cooldown:** 1.5 s (see G2).
- **Design use:** punish the Floating Offering and open boss windows from range.

---

## G6 — Enemy cards

> **Glazed emerald green** tint on the corrupted ones. Concept: `assets/concept/bestiario.png`.

### Jarrito Saltarín (Hopping Jar) — *spam / teaching*
- **HP:** 2 · **Damage:** 1 half heart
- **Behavior:** rhythmic hops toward the player.
- **On death:** splashes a **glaze puddle** (50% slow / 2 s).
- **Role:** teach rebozo timing without punishing.

### Guardián de Dos Caras (Two-Faced Guardian) — *melee pressure*
- **HP:** 8 · **Damage:** 1 heart
- **Behavior:** clay tongue as a whip (frontal) or spike spin (short area).
- **Vulnerable:** during recovery after the spin.
- **Role:** force reading telegraphs and dodging.

### Ofrenda Flotante (Floating Offering) — *ranged*
- **HP:** 4 · **Damage:** 1 half heart per flower
- **Behavior:** levitates and shoots **clay flowers** (spinning projectiles).
- **Role:** reward huarache use; air-space control.

### Pez Pochote Malvado (Evil Pochote Fish) — *flank / reinforcement*
- **HP:** 5 · **Damage:** 1 heart
- **Behavior:** **charge** of spikes by surprise (flank).
- **Role:** lateral pressure, combined with other enemies.

### BOSS — Gran Serpiente de Barro Pochote (Great Clay Serpent), 2 phases
Concept: `assets/concept/jefe-serpiente.png` · **Total HP:** 40

- **Phase 1 — Pot (transformation):** `Rest -> Awaken -> Growinto -> Growth`. In-game cutscene 3–5 s, *skippable*. No damage to the player during the transformation.
- **Phase 2 — Serpent (combat):**
  - Fast bite (short telegraph, high damage: 1 heart).
  - Burst of clay spikes from the mouth (fan-shaped projectiles).
  - **Vulnerable window:** the core glows **Mexican pink** after a heavy attack -> takes damage from rebozo and huarache.
- **Defeat:** health to 0 -> end of level.

---

## G7 — Level progression and conditions

```
[ Workshop entrance ]
   - Master Potter NPC (tutorial: move + jump)
   - 2-3 Jarritos (teach rebozo)
        │
        ▼
[ Drying yard ]
   - Mixed waves: Guardián + Ofrenda + Pez
   - Hazard: glaze puddles
   - Symbolic objective: break 3 corrupted pots -> opens the door
        │  checkpoint
        ▼
[ Boss arena ]
   - Phase 1 pot -> Phase 2 serpent
   - Victory: boss health to 0
```

- **Victory:** boss health bar to 0 -> closing screen.
- **Defeat:** player health to 0 -> respawn at last checkpoint (infinite retries).

---

## G8 — Audio and feedback (minimum slice)

- **SFX:** rebozo strike, huarache throw, glaze splash, hit on enemy, boss roar, pot transformation.
- **Music:** 1 ambient loop for yard/workshop + 1 combat/boss loop. Oaxacan instrumentation suggested (no final license required in the slice).
- **Juice:** brief *hit-stop* on impacts, light *screen shake* on the boss, glaze particles when the Jarrito dies.

---

## Implementation status

See `docs/backlog.md` for the ticket order and `godot/` for the project skeleton (Player greybox + Level01).
