class_name Hurtbox
extends Area2D
## Receives hits from opposing Hitbox nodes and forwards damage to Health.

@export_enum("player", "enemy") var team: String = "enemy"

var _health: Health = null

func _ready() -> void:
	_health = _find_health()

func receive_hit(hitbox: Hitbox) -> void:
	if _health == null:
		_health = _find_health()
	if _health == null or _health.is_dead():
		return
	if not _health.take_damage(hitbox.damage):
		return
	_apply_knockback(hitbox)

func _apply_knockback(hitbox: Hitbox) -> void:
	if hitbox.knockback <= 0.0:
		return
	var body := _find_knockback_body()
	if body != null and body.has_method("apply_knockback"):
		body.apply_knockback(hitbox.global_position, hitbox.knockback)

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
		var health := node.get_node_or_null("Health") as Health
		if health != null:
			return health
		node = node.get_parent()
	return null
