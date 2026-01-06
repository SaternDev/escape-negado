extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var character = $"../TestPlayer"
	position = character.position
	

func cameraZoom(zoomIn):
	if zoomIn:
		zoom.x += 0.4
		zoom.y += 0.4
	if not zoomIn:
		zoom.x -= 0.4
		zoom.y -= 0.4

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed and zoom.x < 10:
			cameraZoom(true)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed and zoom.x > 2.8:
			cameraZoom(false)
