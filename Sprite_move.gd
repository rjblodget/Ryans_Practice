extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 5.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_UP:
			get_node("Sprite").move_local_y(-speed)
		elif event.scancode == KEY_DOWN:
			get_node("Sprite").move_local_y(speed)
		elif event.scancode == KEY_LEFT:
			get_node("Sprite").move_local_x(-speed)
		elif event.scancode == KEY_RIGHT:
			get_node("Sprite").move_local_x(speed)


func _on_Timer_timeout():
	get_tree().change_scene("res://button_panel.tscn")
