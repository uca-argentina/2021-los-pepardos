Class {
	#name : #MultiplayerPlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MultiplayerPlayerTests >> test001TwoPlayersPlayAGameButElDiegoWins [

   | gameBoard gameInstance elDiego dices players elArbol loadedDice lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elArbol := Player withName: 'El Arbol'.
	loadedDice := LoadedDice rolling: 52.
   gameBoard := Board withPositions: 100.
	
	dices := { loadedDice }.
	players := { elDiego . elArbol }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: gameInstance winner equals: elDiego.

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test002ThreePlayersPlayAndTheGameFinishes [

   | gameBoard gameInstance elDiego diceOne dices players elJorge elJulian lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: gameInstance hasFinished

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test003ThreePlayersPlayATurnAndTheGameDoesntFinish [

   | gameBoard gameInstance elDiego diceOne dices players elJorge elJulian lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self deny: gameInstance hasFinished

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test004TwoPlayersPlayTheGameButElDiegoAlwaysWins [

   | gameBoard gameInstance elDiego  elPele loadedDice dices players lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elPele := Player withName: 'El Pele'.
	loadedDice := LoadedDice rolling: 51.

   gameBoard := Board withPositions: 100.
	
	dices := { loadedDice }.
	players := { elDiego . elPele}.

	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance leaderboard) equals: { elDiego . elPele}

	

	
]
