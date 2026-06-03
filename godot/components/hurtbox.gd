class_name Hurtbox
extends Area2D
## Receives hits from opposing Hitbox nodes and forwards damage to Health.

@export_enum("player", "enemy") var team: String = "enemy"

var _health: Health = null

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	_health = _find_health()

func _on_area_entered(area: Area2D) -> void:
	if not area is Hitbox:
		return
	var hitbox := area as Hitbox
	if hitbox.team == team:
		return
	receive_hit(hitbox)

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
