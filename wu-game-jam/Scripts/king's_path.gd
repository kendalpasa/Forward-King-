extends HSlider
@export var game_manager: Node2D

var shown_label1: bool = false
var shown_label2: bool = false
var shown_label3: bool = false

var shown_label5: bool = false

func _physics_process(delta: float) -> void:
	
	var progress_ratio = value / max_value
	
	var king_x_position = size.x * progress_ratio
	
	$TextBubble.position.x = king_x_position + 42
	$Control.position.x = king_x_position
	
	
	if%"King's Path".value >= 75 and not shown_label1:
		shown_label1 = true
		
		$TextBubble.visible = true
		%Label1.visible = true
		
		get_tree().create_timer(5.0).timeout.connect(func():
			$TextBubble.visible = false
			%Label1.visible = false)
			
	if %"King's Path".value >= 150 and not shown_label2:
		shown_label2 = true
		
		$TextBubble.visible = true
		%Label2.visible = true
		
		get_tree().create_timer(5.0).timeout.connect(func():
			%Label2.visible = false
			%Label3.visible = true
			
			get_tree().create_timer(5.0).timeout.connect(func():
				%Label3.visible = false
				%Label4.visible = true
				
				get_tree().create_timer(5.0).timeout.connect(func():
					$TextBubble.visible = false
					%Label4.visible = false
				)
			)
		)
	
	if %"King's Path".value >= game_manager.EnemySpawnValue and not shown_label5:
		shown_label5 = true
		
		$TextBubble.visible = true
		%Label5.visible = true
		
		get_tree().create_timer(5.0).timeout.connect(func():
			$TextBubble.visible = false
			%Label5.visible = false)
	
	if %"King's Path".value >= 10000:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	
	
	%StepsLeft.text = str(int(%"King's Path".value)) + " Steps\nPassive: " + str(int(game_manager.PassiveGain))
