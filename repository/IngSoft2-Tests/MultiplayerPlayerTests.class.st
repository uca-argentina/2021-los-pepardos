Class {
	#name : #MultiplayerPlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MultiplayerPlayerTests >> test001TwoPlayersPlayAGameButElDiegoWins [

   | gameBoard game elDiego dices players elArbol loadedDice lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elArbol := Player withName: 'El Arbol'.
	loadedDice := LoadedDice rolling: 52.
   gameBoard := Board withLoadedPositions.
	
	dices := { loadedDice }.
	players := { elDiego . elArbol }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: game winnerName equals: elDiego.

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test002ThreePlayersPlayAndTheGameFinishes [

   | gameBoard game elDiego diceOne dices players elJorge elJulian lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: game hasFinished

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test003ThreePlayersPlayATurnAndTheGameDoesntFinish [

   | gameBoard game elDiego diceOne dices players elJorge elJulian lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
	elJorge := Player withName: 'El Jorge'.
	elJulian := Player withName: 'El Julian'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego . elJorge . elJulian }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self deny: game hasFinished

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test004TwoPlayersPlayTheGameButElDiegoWins [

   | gameBoard game elDiego  elPele loadedDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
	loadedDice := LoadedDice rolling: 51.

   gameBoard := Board withLoadedPositions.
	
	dices := { loadedDice }.
	players := { elDiego . elPele}.

	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game leaderboard asArray) equals: { elDiego . elPele }

	

	
]

{ #category : #tests }
MultiplayerPlayerTests >> test005FivePlayersPlayTheGameAndTheGameFinishes [

   | gameBoard game elDiego elPela elPele elPeli elPelo diceOne diceTwo diceThree dices players lapsToWin |
	
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
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game hasFinished)

	

	
]
