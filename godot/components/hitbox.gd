class_name Hitbox
extends Area2D
## Active damage dealer. Hits opposing Hurtbox areas once per enable cycle per target.

@export var damage: int = 1
@export var knockback: float = 0.0
@export_enum("player", "enemy") var team: String = "player"

var _struck_hurtboxes: Array[Hurtbox] = []

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	monitoring = false
	monitorable = false

func enable() -> void:
	_struck_hurtboxes.clear()
	monitoring = true
	show()

func disable() -> void:
	monitoring = false
	hide()

func _on_area_entered(area: Area2D) -> void:
	if not area is Hurtbox:
		return
	var hurtbox := area as Hurtbox
	if hurtbox.team == team:
		return
	if hurtbox in _struck_hurtboxes:
		return
	_struck_hurtboxes.append(hurtbox)
	hurtbox.receive_hit(self)
