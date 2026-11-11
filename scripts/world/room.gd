extends Node2D

const TILE := 32
var player_pos := Vector2(320, 190)
var speed := 145.0
var money := 120
var day := 1
var hour := 8
var minute := 0
var player_name := "Developer"
var message := "Welcome to your new beginning."
var show_computer_menu := false
var interaction_hint := "Press E near the computer"

func _ready() -> void:
    queue_redraw()

func _process(delta: float) -> void:
    var dir := Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    )
    if dir.length() > 1.0:
        dir = dir.normalized()
    player_pos += dir * speed * delta
    player_pos.x = clamp(player_pos.x, 42.0, 598.0)
    player_pos.y = clamp(player_pos.y, 88.0, 320.0)
    if Input.is_action_just_pressed("interact") and player_pos.distance_to(Vector2(480, 145)) < 76:
        show_computer_menu = !show_computer_menu
        message = "Computer: Create Game / Projects / Research" if show_computer_menu else "You closed the computer."
    queue_redraw()

func _draw() -> void:
    # Room floor
    draw_rect(Rect2(0, 0, 640, 360), Color("#8b7965"))
    for x in range(0, 640, TILE):
        for y in range(64, 360, TILE):
            var c = Color("#9b8872") if ((x / TILE + y / TILE) % 2 == 0) else Color("#927f6b")
            draw_rect(Rect2(x, y, TILE, TILE), c)
            draw_rect(Rect2(x, y, TILE, TILE), Color("#786957"), false, 1.0)
    # Back wall
    draw_rect(Rect2(0, 0, 640, 72), Color("#51483f"))
    draw_rect(Rect2(0, 68, 640, 8), Color("#c4a47a"))
    # Window
    draw_rect(Rect2(42, 12, 92, 48), Color("#263d55"))
    draw_rect(Rect2(48, 18, 80, 36), Color("#8fb8c9"))
    draw_line(Vector2(88, 18), Vector2(88, 54), Color("#d8d0b8"), 3)
    draw_line(Vector2(48, 36), Vector2(128, 36), Color("#d8d0b8"), 3)
    # Bed
    draw_rect(Rect2(38, 112, 138, 78), Color("#5c4140"))
    draw_rect(Rect2(44, 118, 126, 66), Color("#b7b0a0"))
    draw_rect(Rect2(50, 123, 42, 26), Color("#e4d9bd"))
    draw_rect(Rect2(96, 123, 68, 55), Color("#607d91"))
    # Desk + computer
    draw_rect(Rect2(390, 105, 170, 66), Color("#68452f"))
    draw_rect(Rect2(405, 113, 54, 45), Color("#3c2c25"))
    draw_rect(Rect2(410, 118, 44, 31), Color("#6dc2b4"))
    draw_rect(Rect2(472, 117, 48, 26), Color("#302b2a"))
    draw_rect(Rect2(476, 121, 40, 18), Color("#91c7bd"))
    draw_rect(Rect2(470, 144, 52, 5), Color("#c4a47a"))
    # Cabinet
    draw_rect(Rect2(220, 92, 72, 58), Color("#70513b"))
    draw_rect(Rect2(226, 98, 60, 46), Color("#a47a50"))
    draw_line(Vector2(256, 98), Vector2(256, 144), Color("#5a3d2c"), 2)
    # Player shadow + pixel character
    draw_rect(Rect2(player_pos.x - 10, player_pos.y + 12, 20, 5), Color("#554b43"))
    draw_rect(Rect2(player_pos.x - 8, player_pos.y - 12, 16, 20), Color("#315b83"))
    draw_rect(Rect2(player_pos.x - 7, player_pos.y - 22, 14, 11), Color("#d7a77c"))
    draw_rect(Rect2(player_pos.x - 8, player_pos.y - 25, 16, 6), Color("#342b28"))
    draw_rect(Rect2(player_pos.x - 5, player_pos.y - 7, 3, 3), Color("#262626"))
    draw_rect(Rect2(player_pos.x + 2, player_pos.y - 7, 3, 3), Color("#262626"))
    # HUD
    draw_rect(Rect2(8, 8, 220, 46), Color("#171b23"))
    draw_rect(Rect2(8, 8, 220, 46), Color("#d4b77a"), false, 2)
    draw_string(ThemeDB.fallback_font, Vector2(20, 27), "LIGHTORCH SIMULATOR", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color("#f3d99c"))
    draw_string(ThemeDB.fallback_font, Vector2(20, 45), "DAY %d   $%d   08:00" % [day, money], HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color.WHITE)
    # Message panel
    draw_rect(Rect2(8, 300, 624, 52), Color("#171b23"))
    draw_rect(Rect2(8, 300, 624, 52), Color("#d4b77a"), false, 2)
    draw_string(ThemeDB.fallback_font, Vector2(20, 322), message, HORIZONTAL_ALIGNMENT_LEFT, 600, 13, Color.WHITE)
    draw_string(ThemeDB.fallback_font, Vector2(20, 341), "WASD / Arrow keys: Move     E: Use computer", HORIZONTAL_ALIGNMENT_LEFT, 600, 11, Color("#c5c8d0"))
    if show_computer_menu:
        draw_rect(Rect2(350, 185, 280, 105), Color("#202633"))
        draw_rect(Rect2(350, 185, 280, 105), Color("#d4b77a"), false, 2)
        draw_string(ThemeDB.fallback_font, Vector2(365, 210), "DEVELOPMENT COMPUTER", HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color("#f3d99c"))
        draw_string(ThemeDB.fallback_font, Vector2(365, 235), "1. Start your first game", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color.WHITE)
        draw_string(ThemeDB.fallback_font, Vector2(365, 255), "2. Check project board", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color.WHITE)
        draw_string(ThemeDB.fallback_font, Vector2(365, 275), "Press E to close", HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color("#c5c8d0"))
