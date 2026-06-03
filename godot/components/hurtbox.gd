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
	_health.take_damage(hitbox.damage)

func _find_health() -> Health:
	var node: Node = get_parent()
	while node != null:
		var health := node.get_node_or_null("Health") as Health
		if health != null:
			return health
		node = node.get_parent()
	return null
