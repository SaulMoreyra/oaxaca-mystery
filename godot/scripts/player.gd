extends CharacterBody2D
## La Maestra Alfarera — greybox prototype controller.
## Platformer movement + two attacks (rebozo melee, huarache ranged).
## Numeric values come from docs/GDD.md (appendix G2).

const PROJECTILE_SCENE := preload("res://entities/projectiles/projectile_huarache.tscn")
const REBOZO_ACTIVE_TIME: float = 0.15
const REBOZO_DAMAGE: int = 2
const HUARACHE_DAMAGE: int = 3

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
var _rebozo_hitbox: Hitbox = null
var _rebozo_busy: bool = false
var _health: Health = null
var _spawn_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	add_to_group("player")
	_gravity = ProjectSettings.get_setting("physics/2d/default_gravity", 980.0)
	_spawn_position = global_position
	GameState.set_checkpoint(_spawn_position)
	GameState.reset_player_health()

	_rebozo_hitbox = get_node_or_null("RebozoHitbox") as Hitbox
	if _rebozo_hitbox != null:
		_rebozo_hitbox.damage = REBOZO_DAMAGE
		_rebozo_hitbox.disable()
		_update_rebozo_facing()

	_health = get_node_or_null("Health") as Health
	if _health != null:
		_health.max_hp = GameState.player_max_hp
		_health.sync_hp(GameState.player_hp)
		_health.damaged.connect(_on_health_damaged)
		_health.died.connect(_on_health_died)

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump(delta)
	_handle_move()
	_handle_attacks(delta)
	_update_invulnerability_visual()
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
		_update_rebozo_facing()
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)

func _handle_attacks(delta: float) -> void:
	_huarache_timer = maxf(0.0, _huarache_timer - delta)

	if Input.is_action_just_pressed("attack_rebozo") and not _rebozo_busy:
		_rebozo_attack()

	if Input.is_action_just_pressed("attack_huarache") and _huarache_timer <= 0.0:
		_huarache_attack()
		_huarache_timer = huarache_cooldown

func _rebozo_attack() -> void:
	if _rebozo_hitbox == null:
		return
	_rebozo_busy = true
	_update_rebozo_facing()
	_rebozo_hitbox.enable()
	await get_tree().create_timer(REBOZO_ACTIVE_TIME).timeout
	_rebozo_hitbox.disable()
	_rebozo_busy = false

func _huarache_attack() -> void:
	var projectile: Node2D = PROJECTILE_SCENE.instantiate()
	var spawn_offset := Vector2(_facing * 48.0, -72.0)
	projectile.global_position = global_position
	if projectile.has_method("setup"):
		projectile.setup(_facing, spawn_offset)
	get_tree().current_scene.add_child(projectile)

func apply_knockback(from_global_position: Vector2, force: float) -> void:
	var direction: float = signf(global_position.x - from_global_position.x)
	if direction == 0.0:
		direction = -float(_facing)
	velocity.x = direction * force

func _on_health_damaged(amount: int, remaining: int) -> void:
	GameState.player_hp = remaining
	Events.player_damaged.emit(amount, remaining)

func _on_health_died() -> void:
	await get_tree().create_timer(0.4).timeout
	_respawn()

func _respawn() -> void:
	if _health != null:
		_health.heal_full()
	GameState.reset_player_health()
	global_position = GameState.last_checkpoint
	velocity = Vector2.ZERO

func _update_invulnerability_visual() -> void:
	if _health == null or not _health.is_invulnerable():
		modulate = Color.WHITE
		return
	var blink_on: bool = int(Time.get_ticks_msec() / 80) % 2 == 0
	modulate = Color(1.0, 1.0, 1.0, 0.45) if blink_on else Color.WHITE

func _update_rebozo_facing() -> void:
	if _rebozo_hitbox == null:
		return
	_rebozo_hitbox.position.x = 56.0 * float(_facing)
	_rebozo_hitbox.scale.x = float(_facing)
