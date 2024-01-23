extends Node2D
class_name Snowman 


@onready var timer = $Timer
@onready var smile = $Smile
@onready var frown = $Frown

var is_smiling = false
var melt_rate = 0.2


func _ready(): 
	timer.timeout.connect(ToggleEmotions)

#delta time inm sec	
func _process(delta):
	scale.y -= melt_rate * delta 
	if scale.y <= 0.1: 
		queue_free()

#toggle 
func ToggleEmotions():
	if is_smiling == true: 
		Frowning()
		is_smiling = false
	else: 
		Smiling()
		is_smiling = true
	
func Frowning(): 
	smile.hide() 
	frown.show() 
	
func Smiling():
	smile.show() 
	frown.hide() 
	
