extends Area2D
## Active damage dealer. Hits opposing hurtbox areas once per enable cycle per target.

@export var damage: int = 1
@export var knockback: float = 0.0
@export_enum("player", "enemy") var team: String = "player"

var _struck_areas: Array[Area2D] = []

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	monitoring = false
	monitorable = false

func enable() -> void:
	_struck_areas.clear()
	monitoring = true
	show()

func disable() -> void:
	monitoring = false
	hide()

func _on_area_entered(area: Area2D) -> void:
	if not area.has_method("receive_hit"):
		return
	if area.get("team") == team:
		return
	if area in _struck_areas:
		return
	_struck_areas.append(area)
	area.receive_hit(self)
