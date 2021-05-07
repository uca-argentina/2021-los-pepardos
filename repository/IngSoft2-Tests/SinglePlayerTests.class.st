Class {
	#name : #SinglePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SinglePlayerTests >> test001ElDiegoPlaysOneTurnAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 1.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test002OnePlayerPlaysTheGameAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 75.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test003ElDiegoPlaysWithTwoDicesAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 4.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 75.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test004ElDiegoPlaysOneTurnAndDoesntWin [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 10.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance leaderboard) isEmpty.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test005ElDiegoBeingsPlayingAtPosition0 [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 1.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard.

	self assert: (gameInstance positionOf: elDiego) equals: 0.

	

	
]
