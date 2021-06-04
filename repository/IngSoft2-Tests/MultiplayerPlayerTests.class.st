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
   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { loadedDice }.
	players := { elDiego . elArbol }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: gameInstance winnerName equals: elDiego.

	

	
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
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
	loadedDice := LoadedDice rolling: 51.

   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { loadedDice }.
	players := { elDiego . elPele}.

	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance leaderboard asArray) equals: { elDiego . elPele }

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test005FivePlayersPlayTheGameAndTheGameFinishes [

   | gameBoard gameInstance elDiego elPela elPele elPeli elPelo diceOne diceTwo diceThree dices players lapsToWin |
	
	elDiego := 'El Diego'.
	elPela := 'El Pela'.
	elPele := 'El Pele'.
	elPeli := 'El Peli'.
	elPelo := 'El Pelo'.
	diceOne := Dice withSides: 5.
	diceTwo := Dice withSides: 6.
	diceThree := Dice withSides: 7.

   gameBoard := Board withPositions: 500.
	
	dices := { diceOne . diceTwo . diceThree }.
	players := { elDiego . elPela . elPele . elPeli . elPelo}.

	lapsToWin := 4.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance hasFinished)

	

	
]
