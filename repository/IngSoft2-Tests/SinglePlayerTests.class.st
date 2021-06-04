Class {
	#name : #SinglePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SinglePlayerTests >> test001ElDiegoPlaysOneTurnAndWins [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 200.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test002OnePlayerPlaysTheGameAndWins [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin |
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test003ElDiegoPlaysWithTwoDicesAndWins [
	| gameBoard gameInstance diceOne dices players lapsToWin |
	diceOne := Dice withSides: 4.
	diceOne := Dice withSides: 6.
	gameBoard := Board withPositions: 100.
	dices := {diceOne}.
	players := {'El Diego'}.
	lapsToWin := 2.
	gameInstance := IngSoft2Game
		beingPlayedBy: players
		with: dices
		on: gameBoard
		wherePlayersNeedToComplete: lapsToWin.
	gameInstance playGame.
	self assert: gameInstance winnerName equals: 'El Diego'
]

{ #category : #tests }
SinglePlayerTests >> test004ElDiegoPlaysOneTurnAndDoesntWin [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self assert: (gameInstance winner) isNil.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test005ElDiegoBeingsPlayingAtPosition1 [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin |
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (gameInstance positionOf: elDiego) equals: 1.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test006ElDiegoPlaysAGameWithALoadedAndANormalDiceAndWins [

   | gameBoard gameInstance elDiego normalDice loadedDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 6.
	loadedDice := LoadedDice rolling: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { normalDice . loadedDice }.
	players := { elDiego }.
	lapsToWin := 2.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test007ElDiegoPlaysAGameAndIsOnLap3WhenGameIsDone [

   | gameBoard gameInstance elDiego normalDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { normalDice }.
	players := { elDiego }.
	lapsToWin := 3.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance lapsCompletedBy: elDiego) equals: 3.

	

	
]
