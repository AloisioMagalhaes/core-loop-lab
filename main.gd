extends Node2D

const ARENA := Rect2(40, 100, 880, 390)
const PLAYER_SPEED := 260.0
const ROUND_LENGTH := 45.0

var player := Vector2(480, 300)
var target := Vector2.ZERO
var score := 0
var level := 1
var time_left := ROUND_LENGTH
var feedback := "Collect the pulse. Move with WASD or arrows."
var pulse_phase := 0.0

func _ready() -> void:
	randomize()
	target = _new_target()
	queue_redraw()

func _process(delta: float) -> void:
	if time_left <= 0.0:
		feedback = "Run complete — press R to play again."
		queue_redraw()
		return
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player += direction * PLAYER_SPEED * delta
	player.x = clamp(player.x, ARENA.position.x + 18.0, ARENA.end.x - 18.0)
	player.y = clamp(player.y, ARENA.position.y + 18.0, ARENA.end.y - 18.0)
	if player.distance_to(target) < 28.0:
		score += 1
		level = 1 + score / 5
		feedback = "Great! Pulse collected. Level %d — keep the loop going." % level
		target = _new_target()
		time_left = min(ROUND_LENGTH, time_left + 1.5)
	time_left -= delta
	pulse_phase += delta
	queue_redraw()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		player = Vector2(480, 300)
		score = 0
		level = 1
		time_left = ROUND_LENGTH
		feedback = "New run started. Collect the pulse."
		target = _new_target()

func _new_target() -> Vector2:
	return Vector2(randf_range(ARENA.position.x + 30, ARENA.end.x - 30), randf_range(ARENA.position.y + 30, ARENA.end.y - 30))

func _draw() -> void:
	draw_rect(Rect2(0, 0, 960, 540), Color("101827"))
	draw_rect(ARENA, Color("17253b"), true)
	draw_rect(ARENA, Color("4f6b91"), false, 2.0)
	var pulse_radius := 14.0 + sin(pulse_phase * 4.0) * 4.0
	draw_circle(target, pulse_radius + 9.0, Color(0.2, 0.9, 0.8, 0.12))
	draw_circle(target, pulse_radius, Color("4de1c1"))
	draw_circle(player, 18.0, Color("ffc857"))
	draw_circle(player, 8.0, Color("fff2b2"))
	draw_string(ThemeDB.fallback_font, Vector2(40, 42), "CORE LOOP LAB", HORIZONTAL_ALIGNMENT_LEFT, -1, 28, Color("eef5ff"))
	draw_string(ThemeDB.fallback_font, Vector2(40, 72), "Score: %d    Level: %d    Time: %02d" % [score, level, max(0, int(time_left))], HORIZONTAL_ALIGNMENT_LEFT, -1, 20, Color("a9c7e8"))
	draw_string(ThemeDB.fallback_font, Vector2(40, 520), feedback, HORIZONTAL_ALIGNMENT_LEFT, -1, 18, Color("d6e7ff"))
