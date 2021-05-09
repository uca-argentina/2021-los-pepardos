Class {
	#name : #MultiplayerPlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MultiplayerPlayerTests >> test001TwoPlayersPlayAGameButElDiegoWins [

   | gameBoard gameInstance elDiego dices players elNico loadedDice |
	
	elDiego := Player withName: 'El Diego'.
	elNico := Player withName: 'El Nico'.
	loadedDice := LoadedDice rolling: 5.
   gameBoard := Board withPositions: 15.
	
	dices := { loadedDice }.
	players := { elDiego . elNico }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: gameInstance winner equals: elDiego.

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test002ThreePlayersPlayAndTheGameFinishes [

   | gameBoard gameInstance elDiego diceOne dices players elJorge elJulian |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 10.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: gameInstance hasFinished

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test003ThreePlayersPlayATurnAndTheGameDoesntFinish [

   | gameBoard gameInstance elDiego diceOne dices players elJorge elJulian |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 10.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playTurn.

	self deny: gameInstance hasFinished

	

	
]