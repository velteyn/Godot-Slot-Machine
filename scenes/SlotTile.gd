extends Node2D
class_name SlotTile

var size :Vector2
var tween : Tween
var speed : int
	
func _init():
	pass

func set_texture(tex):
	$Sprite2D.texture = tex
	set_size(size)

func set_size(new_size: Vector2):
	size = new_size
	$Sprite2D.scale = size / $Sprite2D.texture.get_size()
  
func set_velocity(spd):
	speed = spd
	
  
func move_to(to: Vector2):
	tween = get_tree().create_tween()
	tween.set_speed_scale(speed)
	tween.tween_property(self, "position",to , 1).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT) 
	tween.connect("finished",Callable(get_node("../../SlotMachine"), "_on_tile_moved").bind(self))  

func move_by(by: Vector2):
	move_to(position + by)
  
func spin_up():
	$Animations.play('SPIN_UP')
  
func spin_down():
	$Animations.play('SPIN_DOWN')
  
