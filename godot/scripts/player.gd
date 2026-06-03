extends CharacterBody2D
## La Maestra Alfarera — greybox prototype controller.
## Platformer movement + two attacks (rebozo melee, huarache ranged).
## Numeric values come from docs/GDD.md (appendix G2).

@export var speed: float = 320.0
@export var jump_velocity: float = -780.0
@export var huarache_cooldown: float = 1.5

# Feel timings (G3).
const COYOTE_TIME: float = 0.1
const JUMP_BUFFER: float = 0.12

var _gravity: float = 980.0
var _coyote_timer: float = 0.0
var _jump_buffer_timer: float = 0.0
var _huarache_timer: float = 0.0
var _facing: int = 1

func _ready() -> void:
	_gravity = ProjectSettings.get_setting("physics/2d/default_gravity", 980.0)

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump(delta)
	_handle_move()
	_handle_attacks(delta)
	move_and_slide()

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += _gravity * delta
		_coyote_timer -= delta
	else:
		_coyote_timer = COYOTE_TIME

func _handle_jump(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		_jump_buffer_timer = JUMP_BUFFER
	else:
		_jump_buffer_timer -= delta

	if _jump_buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = jump_velocity
		_jump_buffer_timer = 0.0
		_coyote_timer = 0.0

func _handle_move() -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	if direction != 0.0:
		velocity.x = direction * speed
		_facing = 1 if direction > 0.0 else -1
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)

func _handle_attacks(delta: float) -> void:
	_huarache_timer = max(0.0, _huarache_timer - delta)

	if Input.is_action_just_pressed("attack_rebozo"):
		_rebozo_attack()

	if Input.is_action_just_pressed("attack_huarache") and _huarache_timer <= 0.0:
		_huarache_attack()
		_huarache_timer = huarache_cooldown

func _rebozo_attack() -> void:
	# TODO: enable frontal hitbox (2 dmg) and play the 5-frame animation.
	print("[Maestra] Rebozo whip -> facing ", _facing)

func _huarache_attack() -> void:
	# TODO: instance ProjectileHuarache (3 dmg) with an arc toward _facing.
	print("[Maestra] Huarache throw -> facing ", _facing)
