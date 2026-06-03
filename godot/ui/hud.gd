extends CanvasLayer
## Heart HUD driven by Events.player_damaged (GDD G2: 4 hearts / 8 halves).

@onready var _hearts_row: HBoxContainer = $Margin/VBox/HeartsRow
@onready var _hp_label: Label = $Margin/VBox/HpLabel

const HEART_FULL_COLOR := Color(0.95, 0.08, 0.45)
const HEART_HALF_COLOR := Color(0.95, 0.08, 0.45, 0.55)
const HEART_EMPTY_COLOR := Color(0.25, 0.18, 0.14)

func _ready() -> void:
	Events.player_damaged.connect(_on_player_damaged)
	_refresh(GameState.player_hp, GameState.player_max_hp)

func _on_player_damaged(_amount: int, remaining_hp: int) -> void:
	_refresh(remaining_hp, GameState.player_max_hp)

func _refresh(current_hp: int, max_hp: int) -> void:
	var heart_slots: int = maxi(max_hp / 2, 1)
	_ensure_heart_slots(heart_slots)

	for i in heart_slots:
		var slot := _hearts_row.get_child(i) as ColorRect
		var slot_value: int = current_hp - i * 2
		if slot_value >= 2:
			slot.color = HEART_FULL_COLOR
		elif slot_value == 1:
			slot.color = HEART_HALF_COLOR
		else:
			slot.color = HEART_EMPTY_COLOR

	if _hp_label != null:
		_hp_label.text = "HP %d / %d" % [current_hp, max_hp]

func _ensure_heart_slots(count: int) -> void:
	while _hearts_row.get_child_count() < count:
		var heart := ColorRect.new()
		heart.custom_minimum_size = Vector2(36, 36)
		_hearts_row.add_child(heart)
	while _hearts_row.get_child_count() > count:
		var last := _hearts_row.get_child(_hearts_row.get_child_count() - 1)
		last.queue_free()
