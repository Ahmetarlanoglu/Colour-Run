extends Node
var start_money=0
var state
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSave.loadValue("player","section1")
	var current_level="LEVEL  "+str(GlobalSave.display_value)
	$level_label.text=current_level
	GlobalSave.loadMoney("money","section2")
	start_money=GlobalSave.money_value
#	if OS.get_name()=="Android":
#		for i in self.get_children():
#			i.scale*=2

func _process(delta):
	$gold_label.text=str(Global.money_collected+start_money)
var succces_guard=true
func succes_state():
	$AudioStreamPlayer.play(0)
	GlobalSave.loadValue("player","section1")
	$earned_money_label.text=str(Global.money_collected+(50*GlobalSave.display_value))
	state=1
	$level_label.visible=false
	$Button.disabled=false
	$ColorRect.visible=true
	$continue_label.visible=true
	$continue_rect.visible=true
	$MarginContainer.visible=true
	$gold_label2.visible=true
	$earned_money_label.visible=true
	$gold_texture2.visible=true
	if succces_guard:
		succces_guard=false
		GlobalSave.loadMoney("money","section2")
		GlobalSave.loadValue("player","section1")
		GlobalSave.money_value+=Global.money_collected+(50*GlobalSave.display_value)
		GlobalSave.saveValue("money","section2")
	
	
func fail_state():
	state=0
	$ColorRect.visible=true
	$continue_label.visible=true
	$continue_rect.visible=true
	$level_label.visible=false
	$Button.disabled=false
	$lose_label.visible=true
func _on_button_button_down():
	Global.reset_script()
	if state==1:
		Global.succes_state()
	elif state==0:
		Global.fail_state()
	get_tree().paused = false
