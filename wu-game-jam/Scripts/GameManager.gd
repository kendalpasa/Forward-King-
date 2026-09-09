extends Node2D


var jesterCount = 0
var jesterCPS = 1
var jesterCost = 50

var PressCPS = 1

var Press_lvl2_upgradeCost = 600
var Press_lvl3_upgradeCost = 3000

var jester_lvl2_upgradeCost = 350
var jester_lvl3_upgradeCost = 1500

var jesterUpgrade1 = false
var jesterUpgrade2 = false

var pressUpgrade1 = false
var pressUpgrade2 = false

var currentStep = 0
var PassiveGain = 0

var EnemyActive = false
var EnemySpawnValue = 2000
var EnemySpeed = 35



func _ready() -> void:
	%"King's Path".value = currentStep
	%JesterCostLabel_lvl1.text = "Cost " + str(jesterCost)
	%JesterCountLabel_lvl1.text = str(jesterCount)
	
	%Jester_lvl2_Label.text = str(int(jester_lvl2_upgradeCost)) + " Step"
	%Jester_lvl3_Label.text = str(int(jester_lvl3_upgradeCost)) + " Step"
	%Press_lvl2_Label.text = str(int(Press_lvl2_upgradeCost)) + " Step"
	%Press_lvl3_Label.text = str(int(Press_lvl3_upgradeCost)) + " Step"
	
func _physics_process(delta: float) -> void:
	%"King's Path".value = currentStep
	if PassiveGain > 0:
		currentStep += PassiveGain * delta
	
	if currentStep >= 155:
		%JesterButton_lvl1.visible = true
	
	if currentStep >= 250 and not jesterUpgrade1:
		%ShopMenuJester.visible = true
		%Jester_lvl1_UpgradeButton.visible = true
		%Jester_lvl2_Label.visible = true
		
	if currentStep >= 350 and not jesterUpgrade2:
		%Jester_lvl2_UpgradeButton.visible = true
		%Jester_lvl3_Label.visible = true
		
	if currentStep >= 400 and not pressUpgrade1:
		%ShopMenuPress.visible = true
		%Press_lvl1_UpgradeButton.visible = true
		%Press_lvl2_Label.visible = true
		
	if currentStep >= 600 and not pressUpgrade2:
		%Press_lvl2_UpgradeButton.visible = true
		%Press_lvl3_Label.visible = true
	
	if jesterUpgrade1 == true:
		%Jester_lvl1_UpgradeButton.visible = false
		
		%JesterButton_lvl1.visible = false
		%JesterButton_lvl2.visible = true
		%Jester_lvl2_Label.visible = false
		
		%JesterCostLabel_lvl2.text = "Cost " + str(jesterCost)
		%JesterCountLabel_lvl2.text = str(jesterCount)
		
	if jesterUpgrade2 == true:
		%Jester_lvl2_UpgradeButton.visible = false
		
		%JesterButton_lvl2.visible = false
		%JesterButton_lvl3.visible = true
		%Jester_lvl3_Label.visible = false
		
		%JesterCostLabel_lvl3.text = "Cost " + str(jesterCost)
		%JesterCountLabel_lvl3.text = str(jesterCount)
		
	if jesterUpgrade1 == true and jesterUpgrade2 == true:
		%ShopMenuJester.visible = false
		
	if pressUpgrade1 == true:
		%Press_lvl1_UpgradeButton.visible = false
		
		%Button.visible = false
		%Button_lvl2.visible = true
		%Press_lvl2_Label.visible = false
		
	if pressUpgrade2 == true:
		%Press_lvl2_UpgradeButton.visible = false
		
		%Button_lvl2.visible = false
		%Button_lvl3.visible = true
		%Press_lvl3_Label.visible = false
	
	if pressUpgrade1 == true and pressUpgrade2 == true:
		%ShopMenuPress.visible = false
	
	
	
	if currentStep >= EnemySpawnValue:
		%"Enemie's Path".visible = true
		EnemyActive = true
	
	if EnemyActive == true:
		%"Enemie's Path".value += EnemySpeed * delta
	
	if %"Enemie's Path".value >= %"King's Path".value:
		get_tree().change_scene_to_file("res://Scenes/tryAgain.tscn")



func _on_jester_button_lvl_1_pressed() -> void:
	if currentStep >= jesterCost:
		currentStep -= jesterCost
		jesterCount += 1
		PassiveGain = jesterCount * jesterCPS
		jesterCost = int(jesterCost * 1.3)
		%JesterCostLabel_lvl1.text = "Cost " + str(jesterCost)
		%JesterCountLabel_lvl1.text = str(jesterCount)

func _on_jester_button_lvl_2_pressed() -> void:
	if currentStep >= jesterCost:
		currentStep -= jesterCost
		jesterCount += 1
		PassiveGain = jesterCount * jesterCPS
		jesterCost = int(jesterCost * 1.3)
		%JesterCostLabel_lvl2.text = "Cost " + str(jesterCost)
		%JesterCountLabel_lvl2.text = str(jesterCount)

func _on_jester_button_lvl_3_pressed() -> void:
	if currentStep >= jesterCost:
		currentStep -= jesterCost
		jesterCount += 1
		PassiveGain = jesterCount * jesterCPS
		jesterCost = int(jesterCost * 1.3)
		%JesterCostLabel_lvl3.text = "Cost " + str(jesterCost)
		%JesterCountLabel_lvl3.text = str(jesterCount)


func _on_button_pressed() -> void:
	currentStep += PressCPS

func _on_button_lvl_2_pressed() -> void:
	currentStep += PressCPS

func _on_button_lvl_3_pressed() -> void:
	currentStep += PressCPS



func _on_jester_lvl_1_upgrade_button_pressed() -> void:
	if currentStep >= jester_lvl2_upgradeCost:
		currentStep -= jester_lvl2_upgradeCost
		jesterCPS += 2
		jesterUpgrade1 = true
		PassiveGain = jesterCount * jesterCPS


func _on_jester_lvl_2_upgrade_button_pressed() -> void:
	if currentStep >= jester_lvl3_upgradeCost:
		currentStep -= jester_lvl3_upgradeCost
		jesterCPS += 8
		jesterUpgrade2 = true
		PassiveGain = jesterCount * jesterCPS


func _on_press_lvl_1_upgrade_button_pressed() -> void:
	if currentStep >= Press_lvl2_upgradeCost:
		currentStep -= Press_lvl2_upgradeCost
		PressCPS = 5
		pressUpgrade1 = true


func _on_press_lvl_2_upgrade_button_pressed() -> void:
	if currentStep >= Press_lvl3_upgradeCost:
		currentStep -= Press_lvl3_upgradeCost
		PressCPS = 50
		pressUpgrade2 = true
