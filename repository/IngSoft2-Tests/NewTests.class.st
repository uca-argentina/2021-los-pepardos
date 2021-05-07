Class {
	#name : #NewTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
NewTests >> test001ElDiegoPlaysOneTurnAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 1.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
NewTests >> test002OnePlayerPlaysTheGameAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 75.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
NewTests >> test003ElDiegoPlaysWithTwoDicesAndWins [

   | gameBoard gameInstance elDiego elSeba diceOne dices players loadedDice |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 4.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 75.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
NewTests >> test004ElDiegoPlaysOneTurnAndDoesntWin [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 10.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := Game beingPlayedBy: players with: dices on: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance leaderboard) isEmpty.

	

	
]
