extends Node
var display_value=1
var money_value=0
var save_path="user://save-file.cfg"
var config= ConfigFile.new()
var load_response= config.load(save_path)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func saveValue(section,key):
	if section=="money":
		config.set_value(section,key,money_value)
	else:
		config.set_value(section,key,display_value)
	config.save(save_path)
	
func loadValue(section,key):
	display_value=config.get_value(section,key,display_value)
func loadMoney(section,key):
	money_value=config.get_value(section,key,money_value)
#GlobalSave.loadValue("player","section1")
#		if GlobalSave.display_value<4:
#			GlobalSave.display_value=4
#			GlobalSave.saveValue("player","section1")
