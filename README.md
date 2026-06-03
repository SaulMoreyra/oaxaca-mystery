# Oaxaca Mystery — *Corazón de la Alfarería*

A **2D side-scroller action game** for iOS and Android. A master potter from Santa María Atzompa fights clay pieces corrupted by a mystical energy, with a traditional engraving art style (woodcut / Posada) and neon glazed-clay accents.

This repo contains the **pitch deck**, the design documentation, and the skeleton of the **vertical slice** (greybox prototype in Godot 4).

## How to run the project

There are two runnable things: the **deck** (presentation) and the **game** (Godot prototype).

### 1. The deck (presentation) — no install required

The simplest way is to open the file directly in a browser:

```bash
# macOS
open deck/index.html
```

For better compatibility (some browsers block loading local images over `file://`), serve it with a local server:

```bash
# From the oaxaca-mystery/ folder
python3 -m http.server 8000
# then open http://localhost:8000/deck/ in the browser
```

Deck controls: arrow keys to navigate · `F` fullscreen · `S` speaker notes · `Esc` overview. To export to PDF, open `http://localhost:8000/deck/?print-pdf` and use the browser's print dialog (save as PDF).

> Requires internet the first time (reveal.js loads via CDN).

### 2. The game (Godot prototype)

**Requirement:** [Godot 4.2+](https://godotengine.org/download). On macOS you can also install it with Homebrew:

```bash
brew install --cask godot
```

Open and run:

```bash
# Option A — from the terminal (if you installed Godot via brew)
godot --path godot

# Option B — from the app
# 1. Open Godot -> "Import" button
# 2. Select oaxaca-mystery/godot/project.godot
# 3. Press Play (F5)
```

The main scene is `godot/scenes/Level01_Atzompa.tscn` (it loads automatically on Play). The first time, Godot imports the background texture and assigns UIDs automatically.

Game controls (keyboard):

| Key | Action |
|-----|--------|
| A / D | Move |
| Space | Jump |
| J | Rebozo whip (melee) |
| K | Huarache throw (ranged) |

For now the attacks only print to the Godot console (see TODOs in `godot/scripts/player.gd`). Full details in [`godot/README.md`](godot/README.md).

## Structure

```
oaxaca-mystery/
├── deck/
│   └── index.html              # Presentation (reveal.js): pitch + appendices. Open in a browser.
├── docs/
│   ├── GDD.md                  # Game Design Document for the slice (gameplay G1–G8)
│   ├── art-bible.md            # Art bible + full AI mega-prompt
│   └── backlog.md              # Ordered tickets for the vertical slice
├── assets/
│   ├── concept/                # Delivered concept art (5 boards + background)
│   └── sprites/                # Game-ready sprites (in progress)
└── godot/                      # Godot 4 project (greybox prototype). See godot/README.md
```

## Project status

| Area | Status |
|------|--------|
| Concept art (character, bestiary, boss, background) | Done |
| Vertical slice GDD | Done (v0.1) |
| Art bible + mega-prompt | Done |
| Godot greybox project (Player + Level01) | Done |
| Game-ready sprites, VFX, audio, mobile builds | Pending (see `docs/backlog.md`) |

## Vertical slice (scope)

1 level (Atzompa workshop + drying yard) · The Master Potter with rebozo (melee) + huarache (ranged) · 4 enemies + the Great Serpent boss in 2 phases · Master Potter NPC (tutorial).

## Engine

**Godot 4** — chosen for its native 2D support, reasonable iOS/Android export, and low cost for small teams. See `godot/README.md` to open and run the prototype.

## Note on language

Project convention: all documentation (this README, `docs/`, and code comments) is written in **English**. Proper nouns specific to the game's identity (title, character and enemy names such as *Maestra Alfarera*, *Jarrito Saltarín*, *Pochote*) are kept in Spanish on purpose. The pitch deck under `deck/` is audience-facing presentation content and is kept in Spanish.
