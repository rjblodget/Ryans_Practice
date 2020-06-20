extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_1_pressed():
	get_node("Label").text = "you pushed a button!" # Replace with function body.


func _on_Button_2_pressed():
	get_node("Label").text = "Aren't you daring?" # Replace with function body.
	get_node("Timer").start()


func _on_Timer_timeout():
	get_tree().change_scene("res://Sprite_move.tscn")
