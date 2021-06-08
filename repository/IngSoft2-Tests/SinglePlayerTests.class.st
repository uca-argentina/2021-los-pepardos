Class {
	#name : #SinglePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SinglePlayerTests >> test001ElDiegoPlaysAndWins [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 200.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test002ElDiegoPlaysWithTwoDicesAndWins [
	| gameBoard game diceOne dices players lapsToWin |
	
	diceOne := Dice withSides: 4.
	diceOne := Dice withSides: 6.
	gameBoard := Board withPositions: 100.
	
	dices := {diceOne}.
	players := {'El Diego'}.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard	wherePlayersNeedToComplete: lapsToWin.
		
	game playGame.
	self assert: game winnerName equals: 'El Diego'
]

{ #category : #tests }
SinglePlayerTests >> test003ElDiegoPlaysOneTurnAndDoesntWin [

   | gameBoard game elDiego diceOne dices players lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self deny: game hasFinished.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test004ElDiegoBeingsPlayingAtPosition1 [

   | gameBoard game elDiego diceOne dices players lapsToWin |
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (game positionOf: elDiego) equals: 1.
	self assert: (game lapsCompletedBy: elDiego) equals: 0.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test005ElDiegoPlaysAGameWithALoadedAndANormalDiceAndWins [

   | gameBoard game elDiego normalDice loadedDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 6.
	loadedDice := LoadedDice rolling: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { normalDice . loadedDice }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test006ElDiegoPlaysAGameAndIsOnLap3WhenGameIsDone [

   | gameBoard game elDiego normalDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { normalDice }.
	players := { elDiego }.
	lapsToWin := 3.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game lapsCompletedBy: elDiego) equals: 3.

	

	
]
