extends Node2D

# TITLE : BallDropPosition
# Functions :  _on_Player_panel_addToBoard, _on_Player_Panel_startEnemyTurn,
#		_on_enemySpawnBallZone_startPlayerTurn, _on_Area2d_sendBallToDiscard
# Purpose: Allows Balls To Be Dropped from a specific zone on the peg board
# Closely Related Scripts : PlayerPanel, GarbageCollector, enemySpawnBallZone

# Connected to : PlayerPanel
# Purpose : Informs the PlayerPanel to Discard a ball
signal addToDiscard(ball)


var arrayOfBalls := []


# Recieved From : PlayerPanel
# Purpose : Instances a ball recieved from PlayerPanel and puts it into the cup
func _on_Player_Panel_addToBoard(ball : PackedScene) -> void:
	arrayOfBalls.push_front(ball)
	var newBall = ball.instance()
	
	#Ensures the Ball will interact correctly with team zones
	newBall.setBallTeam("Player")
	self.add_child(newBall)
	
	#makes the ball interactable without usual physics applied
	newBall.draggable(true)
	newBall.stopBouncingPhysics()


# Recieved From : PlayerPanel
# Purpose : Ensures balls cannot be interacted with during enemy turn
func _on_Player_Panel_startEnemyTurn() -> void:
	for i in get_children():
		i.draggable(false)


# Recieved From : enemySpawnBallZone
# Purpose : Ensures balls can be interacted with during player turn
func _on_enemySpawnBallZone_startPlayerTurn() -> void:
	for i in get_children():
		i.draggable(true)


# Recieved From : GarbageCollector
# Purpose : finds and removes a specfic ball from the array
func _on_Area2D_sendBallToDiscard(ball : Node) -> void:
	var index = 0
	for i in arrayOfBalls.size():
		
		#this ensures the exact ball is being removed
		if(ball.get_filename() == arrayOfBalls[i].get_path()):
			call_deferred("emit_signal", "addToDiscard", arrayOfBalls[i])
			index = i
			break
	arrayOfBalls.remove(index)
