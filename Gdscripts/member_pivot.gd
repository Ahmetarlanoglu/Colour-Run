extends Node3D


# Called when the node enters the scene tree for the first time.


func trigger(body):
	
	
	if body!=$cat_pack3:
		$cat_pack3.start_movement(body) 

	if body!=$cat_pack4:
		$cat_pack4.start_movement(body) 

		

	if body!=$cat_pack5:

		$cat_pack5.start_movement(body) 

		
