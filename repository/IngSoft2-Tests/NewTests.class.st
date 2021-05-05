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
	gameInstance := Game withPlayer: players andDice: dices andBoard: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
NewTests >> test002TwoPlayersPlayOneRoundAndElDiegoWins [

   | gameBoard gameInstance elDiego elNico diceOne diceTwo dices players |
	
	elDiego := Player withName: 'El Diego'.
	elNico := Player withName: 'Nico'.
   diceOne := Dice withSides: 6.
	diceTwo := Dice withSides: 5.
   gameBoard := Board withPositions: 2.
	
	dices := { diceOne . diceTwo }.
	players := { elDiego . elNico }.
	gameInstance := Game withPlayer: players andDice: dices andBoard: gameBoard.

	gameInstance playTurn.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]

{ #category : #tests }
NewTests >> test003OnePlayerPlaysTheGameAndWins [

   | gameBoard gameInstance elDiego diceOne dices players |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 75.
	
	dices := { diceOne }.
	players := { elDiego }.
	gameInstance := Game withPlayer: players andDice: dices andBoard: gameBoard.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	
]
