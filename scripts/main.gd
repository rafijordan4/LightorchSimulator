extends Node2D

@onready var world = $World

func _ready() -> void:
    get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
    get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
