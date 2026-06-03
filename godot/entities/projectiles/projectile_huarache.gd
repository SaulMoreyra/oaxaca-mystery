extends Node2D
## Thrown huarache projectile (GDD G5: 3 damage, arc, despawn on hit or bounds).

const SPEED: float = 720.0
const GRAVITY: float = 1400.0
const LIFETIME: float = 2.5
const MAX_TRAVEL_X: float = 1400.0

@export var damage: int = 3

var _velocity: Vector2 = Vector2.ZERO
var _lifetime: float = LIFETIME
var _start_x: float = 0.0
var _hitbox: Area2D = null

func _ready() -> void:
	_hitbox = get_node_or_null("Hitbox") as Area2D
	if _hitbox != null:
		_hitbox.set("damage", damage)
		_hitbox.area_entered.connect(_on_hitbox_area_entered)
	_start_x = global_position.x

func setup(facing: int, spawn_offset: Vector2 = Vector2.ZERO) -> void:
	global_position += spawn_offset
	_start_x = global_position.x
	_velocity = Vector2(facing * SPEED, -280.0)
	scale.x = absf(scale.x) * float(facing)

func _physics_process(delta: float) -> void:
	_velocity.y += GRAVITY * delta
	position += _velocity * delta
	_lifetime -= delta
	if _lifetime <= 0.0 or absf(global_position.x - _start_x) > MAX_TRAVEL_X:
		queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("receive_hit"):
		queue_free()
