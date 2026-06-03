class_name Hurtbox
extends Area2D
## Receives hits from opposing Hitbox nodes and forwards damage to Health.

@export_enum("player", "enemy") var team: String = "enemy"

var _health: Health = null

func _ready() -> void:
	_health = _find_health()

func receive_hit(hitbox: Area2D) -> void:
	if _health == null:
		_health = _find_health()
	if _health == null or _health.is_dead():
		return
	var damage_amount: int = int(hitbox.get("damage"))
	if damage_amount <= 0:
		return
	if not _health.take_damage(damage_amount):
		return
	var knockback_amount: float = float(hitbox.get("knockback"))
	if knockback_amount > 0.0:
		_apply_knockback(hitbox.global_position, knockback_amount)

func _apply_knockback(from_position: Vector2, force: float) -> void:
	var body := _find_knockback_body()
	if body != null and body.has_method("apply_knockback"):
		body.apply_knockback(from_position, force)

func _find_knockback_body() -> Node:
	var node: Node = get_parent()
	while node != null:
		if node is CharacterBody2D:
			return node
		node = node.get_parent()
	return null

func _find_health() -> Health:
	var node: Node = get_parent()
	while node != null:
		var health_node := node.get_node_or_null("Health")
		if health_node is Health:
			return health_node as Health
		node = node.get_parent()
	return null
