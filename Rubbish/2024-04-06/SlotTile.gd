extends Node2D
class_name SlotTile

var size :Vector2
var tween : Tween = create_tween()

func _ready():
	pass

func set_texture(tex):
	$Sprite2D.texture = tex
	set_size(size)

func set_size(new_size: Vector2):
	size = new_size
	$Sprite2D.scale = size / $Sprite2D.texture.get_size()
  
func set_velocity(speed):
	tween.set_speed_scale(speed) 
  
func move_to(to: Vector2):
	tween.interpolate_property(self, "position",
	position, to, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func move_by(by: Vector2):
	move_to(position + by)
  
func spin_up():
	$Animations.play('SPIN_UP')
  
func spin_down():
	$Animations.play('SPIN_DOWN')
  
