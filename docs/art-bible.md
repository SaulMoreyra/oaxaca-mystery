# Art Bible — Oaxaca Mystery

> Project art bible. Source of truth for keeping consistency across concept art, in-game sprites, and AI-generated assets.

---

## A1 — Style

- **Primary style:** traditional wood/metal engraving (woodcut / linocut), inspired by José Guadalupe Posada.
- **Line:** dark, thick, heavy, textured outlines. **Not** clean line art or vectors.
- **Shading:** volume and shadow exclusively via **cross-hatching**, repeated short lines, and engraving dot textures.
- **Animation:** fluid 2D with an artisanal touch; static props have subtle frames where the cross-hatching "breathes" or creaks.

---

## A2 — Palette (suggested hex)

**Organic base (matte earth)**

| Name | Hex |
|------|-----|
| Adobe | `#C4A574` |
| Ochre | `#8B6914` |
| Manta cream | `#F5F0E1` |
| Sepia | `#5C4033` |
| Terracotta | `#A0522D` |

**Energy / magic accents (saturated neon)**

| Name | Hex |
|------|-----|
| Glazed Emerald Green (Level 1 key color) | `#00FF9F` |
| Mexican Pink | `#FF1493` |
| Cempasúchil Orange | `#FF6B00` |
| Neon Blue | `#00D4FF` |

> **Golden rule:** the neon emerald green is reserved for **corrupted clay** (enemies / hazards). The base environment is matte earth, so enemies and hazards stand out.

---

## A3 — UI typography

- **Headings:** condensed poster-style display (reference: Oswald / Bebas) with an editorial Mexican feel.
- **Body / UI:** legible serif (reference: Bitter) or clear sans on mobile. Large sizes due to small screens.

---

## A4 — Protagonist: La Maestra Alfarera (The Master Potter)

- ~55 years old, gray hair in a bun (chongo), wise face with engraved expression lines.
- White manta blouse, long colorful skirt (magenta/orange with textured patterns), dark gray rebozo crossed over the shoulders, leather huaraches.
- **Delivered concept:** `assets/concept/maestra-turnaround.png` (front / left / back).
- **Sprite sheet spec (to be derived):** idle, walk, attack rebozo, attack huarache, hurt, death. Sheet background: textured light Oaxacan parchment.

### Abilities (concept ready)
- **Rebozo whip (melee):** `assets/concept/maestra-rebozo.png` — access (5) + strike (5) + recovery (4).
- **Huarache throw (ranged):** `assets/concept/maestra-huarache.png` — throw (5) + 3 visualization panels.

---

## A5 — NPC and enemies (Level 1)

Delivered concept: `assets/concept/bestiario.png`.

- **El Maestro Alfarero (ally NPC, non-playable):** young man with a hat and machete; walk + run cycles.
- **El Jarrito Saltarín (Hopping Jar):** green clay cup/plate with handle-arms; hops and splashes glaze.
- **El Guardián de Dos Caras (Two-Faced Guardian):** vessel with two faces, side spikes; tongue whip / spin.
- **La Ofrenda Flotante (Floating Offering):** green bottle with a floral filigree crown; shoots flowers.
- **El Pez Pochote Malvado (Evil Pochote Fish):** clay fish with little legs and conical spikes; charges.
- **Boss — Gran Serpiente de Barro Pochote (Great Clay Serpent):** `assets/concept/jefe-serpiente.png` (Phase 1 pot -> Phase 2 serpent).

---

## A6 — Tileset and props for Level 1 — CONCEPT READY

Environment delivered: `assets/concept/escenario-taller-patio.png` (adobe workshop + drying yard, clay kiln, shelves with green clay pieces, hanging manta cloths, jars). Consistent with the palette and engraving style.

- **Pending:** split the scene into **parallax layers** (far background / mid layer / playable foreground) and extract loose breakable props (pots, jars, glaze puddle) as independent tiles/sprites with transparent backgrounds.

### Master environment prompt (full scene)

```
2D side-scroller video game background illustration, traditional Mexican engraving
style (woodcut / linocut in the style of José Guadalupe Posada). Scene: the ADOBE
WORKSHOP AND DRYING YARD of a potter in Santa María Atzompa, Oaxaca.

Side-on composition (profile view for horizontal scrolling), with a flat playable
foreground and a layered background for parallax.

Elements: cracked adobe walls, wooden beams, a clay wood-fired kiln, rustic wooden
shelves with green glazed clay pieces and pots, cream manta cloths hung out to dry,
stacked pots and jars, packed-earth ground with marks, local plants in pots.

STRICT STYLE: dark, thick, textured outlines (no clean or vector line). Volume and
shadow ONLY via cross-hatching and engraving dots. Matte earth palette: adobe,
sepia, ochre, terracotta, manta cream. Sparse GLAZED EMERALD GREEN neon accents on
the clay pieces. Warm workshop lighting. No characters. Artisanal, subtly mystical
atmosphere. 16:9 aspect ratio.
```

**Layer variants:** parallax background (dry hills, distant adobe houses) · mid layer (wall + kiln + shelves + cloths) · playable foreground (adobe platforms, steps, breakable pots) · boss arena (open yard with a central table) · loose props (pot, jar, shelf, beam, cloth, glaze puddle).

---

## A7 — VFX and particles

- Green glaze: Jarrito splash, huarache trail, boss aura.
- Pink/orange rebozo sparkles.
- Boss Mexican-pink core in its vulnerable state.

---

## A8 — UI / HUD (pending)

- Engraving-style hearts; boss health bar; semi-transparent touch buttons; iOS/Android safe areas.

---

## A9 — Animation list (actual status)

| Asset | Status | Reference frames |
|-------|--------|------------------|
| Maestra rebozo | Concept ready | 5 (access) + 5 (strike) + 4 (recovery) |
| Maestra huarache | Concept ready | 5 (throw) + 3 panels |
| Maestra walk/idle/hurt/death | Pending | derive from the turnaround |
| Maestro Alfarero (NPC) | Concept ready | walk + run |
| Jarrito / Guardián / Ofrenda / Pez | Concept ready | idle/death missing |
| Boss Phase 1 pot | Concept ready | Rest -> Awaken -> Growinto -> Growth |
| Boss Phase 2 serpent | Concept ready | idle, lunge, spit spikes, pink vulnerable |
| Workshop + yard background | Concept ready | `assets/concept/escenario-taller-patio.png` |

**Game-ready sprite sheet (idle + walk):** pending generation/derivation from the turnaround for the greybox prototype. Use the prompt in §A10 with `maestra-turnaround.png` as a reference, arranging 2 rows (idle 4 frames, walk 6 frames) on a parchment background.

---

## A10 — Reference mega-prompt (full)

> Paste this whole block into any generative AI to keep consistency. Attach 1–2 boards from `assets/concept/` as a style reference. The original prompt is preserved verbatim in Spanish because it is the canonical reference artifact authored by the team; an English summary follows it.

```
MEGA-PROMPT DE REFERENCIA: PROYECTO MAESTRO 2D - OAXACA MYSTERY

1. DESCRIPCIÓN GENERAL DEL JUEGO
Título Provisional: Corazón de la Alfarería / Barro Verde Mystery.
Género: Juego de acción, plataformas y combate en 2D (Side-scroller / Vista Frontal).
Temática y Ambientación: Inspirado profundamente en la cultura oaxaqueña, mitología
local y sus artesanías tradicionales. El Nivel 1 se desarrolla en un taller y patio de
secado de adobe en Santa María Atzompa, Oaxaca.
Mecánica Central: Los enemigos están hechos de barro tradicional corrupto por una
energía mística. Al ser derrotados o interactuar con el entorno, liberan esmalte o
ataques basados en sus propiedades físicas.

2. GUÍA DE ESTILO VISUAL (ART BIBLE)
Estilo Artístico Principal: Imitación de grabado tradicional en madera o metal (estilo
xilografía / linograbado), inspirado directamente en la obra histórica de José Guadalupe
Posada.
Tratamiento de Línea: Contornos oscuros, gruesos, pesados y texturizados (no arte lineal
limpio o vectorial). Los sombreados internos y volúmenes se definen exclusivamente
mediante técnicas de achurado (cross-hatching), líneas cortas repetidas y texturas de
puntos de grabado.
Paleta de Colores:
  Base Orgánica: Tonos tierra mate, adobe, sepia, ocre, terracota y el color crema crudo
  de la tela de manta.
  Acentos de Energía / Magia: Contrastes fuertes con colores neón muy vibrantes y
  saturados: Verde Esmeralda Vidriado (color clave del Nivel 1), Rosa Mexicano, Naranja
  Cempasúchil y Azul Neón.
Animación (Look & Feel): Animación 2D fluida pero con un toque artesanal. Los objetos
estáticos o texturas pesadas tienen frames sutiles donde el achurado del grabado
"respira" o cruje ligeramente.

3. PERSONAJE PRINCIPAL: LA MAESTRA ALFARERA
Descripción: Una artesana oaxaqueña mayor, de aproximadamente 55 años de edad, con
cabello canoso recogido en un chongo. Tiene facciones sabias y amables marcadas por
líneas de expresión de grabado.
Indumentaria Tradicional: Blusa blanca de manta, una falda larga y colorida (tonos
magenta/naranja con patrones texturizados inferiores), un rebozo gris oscuro texturizado
cruzado sobre los hombros, y huaraches tradicionales de cuero.
Set de Habilidades y Animaciones de Combate:
  Ataque Cuerpo a Cuerpo (Rebozo Látigo): Se desenvuelve fluidamente el rebozo gris de
  los hombros, se blande extendiéndose completamente hacia el frente como un látigo
  energizado con destellos rosa/naranja, golpeando al enemigo, y se vuelve a colocar
  rápidamente alrededor de los hombros en la postura original.
  Ataque a Distancia (Lanzamiento Cruzado de Huarache): Una animación de cuerda (coil)
  donde la Maestra alfarera cruza su mano derecha hacia el lado izquierdo de su cuerpo
  para tomar su huarache de cuero, realiza un arco exagerado hacia atrás y lo lanza con
  fuerza imitando el movimiento de un lanzador de béisbol, proyectando el huarache
  energizado con un rastro de luz brillante hacia el enemigo.

4. BESTIARIO Y ENEMIGOS (NIVEL 1: ATZOMPA)
Todos los enemigos están basados en piezas reales de la alfarería local, cobrando vida
con una tonalidad Verde Esmeralda Vidriada y brillante que contrasta con el fondo de
adobe mate.
1. El Jarrito Saltarín (Enemigo Básico): Inspirado en las tazas y platos de barro verde
con asas que actúan como brazos enojados. Se desplaza dando brincos rítmicos y salpica
charcos de esmalte verde que ralentizan al jugador si los pisa.
2. El Guardián de Dos Caras (Enemigo Pesado/Melee): Una vasija cilíndrica de barro crudo
con dos rostros místicos y grotescos esculpidos, ojos en ranura y picos sobresalientes a
los lados. Ataca de frente sacando una lengua de arcilla afilada como látigo o girando
sobre sí mismo para golpear con sus picos.
3. La Ofrenda Flotante (Enemigo a Distancia): Una elegante botella de barro verde
esmeralda rodeada por un arco o corona flotante de detallado pastillaje de flores de
arcilla. Levita y dispara las flores de barro como proyectiles giratorios hacia el
jugador.
4. El Pez Pochote Malvado (Villano Menor / Refuerzo): Un pez de barro con patitas cortas
y todo el cuerpo cubierto de picos cónicos afilados, compartiendo la misma tonalidad
grisácea/barro crudo texturizada del Guardián de dos caras. Realiza ataques furtivos
embistiendo con sus picos.
5. JEFE DE NIVEL: La Gran Serpiente de Barro Pochote:
  Fase 1 (Transformación): Inicia en el centro del escenario como una maceta cilíndrica
  tradicional con picos ("Pochote") en estado de reposo. De pronto, un fuego verde
  místico emana de su interior, la arcilla se deforma y de la maceta brota y crece una
  enorme criatura reptiliana.
  Fase 2 (Combate): Una imponente serpiente gigante con picos a lo largo de todo su
  cuerpo hecho de un barro verde esmeralda sumamente oscuro y brillante. Ataca lanzando
  mordiscos a gran velocidad, disparando ráfagas de picos de arcilla desde su boca y
  rugiendo mientras su núcleo brilla con un color rosa mexicano cuando es vulnerable a
  los impactos del rebozo o el huarache.

5. INSTRUCCIÓN ADICIONAL PARA IA DE IMAGEN
"Genera los personajes en una hoja de sprites (sprite sheet) organizada en filas con un
fondo de papel pergamino claro oaxaqueño texturizado. Mantén de manera estricta la
consistencia del sombreado por grabado (cross-hatching), las líneas gruesas de
xilografía, y la paleta de colores especificada para garantizar que todo el contenido
pertenezca de forma cohesiva al mismo videojuego."
```

### English summary of the mega-prompt

- **Game:** 2D action/platformer side-scroller, *Corazón de la Alfarería / Barro Verde Mystery*, deeply inspired by Oaxacan culture and traditional pottery. Level 1 is an adobe workshop and drying yard in Santa María Atzompa.
- **Core mechanic:** enemies are traditional clay corrupted by a mystical energy; defeating them or interacting with the environment releases glaze or attacks based on their physical properties.
- **Visual style:** traditional wood/metal engraving (woodcut / linocut, Posada). Dark, thick, textured outlines; volume via cross-hatching and engraving dots only. Matte-earth base palette + saturated neon accents (glazed emerald green, Mexican pink, cempasúchil orange, neon blue). Fluid 2D animation with subtle "breathing" of the hatching on static props.
- **Protagonist (La Maestra Alfarera):** ~55-year-old Oaxacan artisan, gray hair in a bun, manta blouse, magenta/orange skirt, dark gray rebozo, leather huaraches. Melee = rebozo whip with pink/orange sparkles; ranged = cross-body huarache throw with a baseball-pitcher motion and a bright trail.
- **Bestiary (Level 1, all corrupted glazed-emerald clay):** Jarrito Saltarín (basic, hops and splashes slowing glaze), Guardián de Dos Caras (heavy melee, clay tongue whip / spin), Ofrenda Flotante (ranged, shoots clay flowers), Pez Pochote Malvado (minor villain, charges with spikes).
- **Boss — Gran Serpiente de Barro Pochote:** Phase 1 a spiked pot ("Pochote") that, fueled by mystical green fire, grows into a reptilian creature; Phase 2 a giant spiked emerald-clay serpent that bites fast, fires clay-spike bursts, and exposes a Mexican-pink vulnerable core.
- **Image-AI instruction:** produce characters as a sprite sheet organized in rows on a light textured Oaxacan parchment background, strictly keeping cross-hatching shading, thick woodcut lines, and the specified palette for cohesion.
