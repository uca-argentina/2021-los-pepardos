Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#classInstVars : [
		'conCaras',
		'unTablero'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DummyTest >> testDummy [
	"insertar pepardo"
	self assert: Dummy new isDummy
]

{ #category : #tests }
DummyTest >> testOnePlayerWithTwoDicesWinTheGame [
	"insertar pepardo"
	| gameBoard gameInstance elDiego dice1 dice2 diceList elDiegoDiceThrowResult |
	
	elDiego := Player withName: 'El Diego'.
   dice1 := Dice withSides: 6.
	dice2 := Dice withSides: 3.	
	diceList := { dice1 . dice2 }.
	
   gameBoard := Board withPositions: 3.
	gameInstance := Game withPlayer: elDiego andDice: diceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: diceList.
	gameInstance update: elDiego positionInBoardBy: elDiegoDiceThrowResult.
	
	gameInstance checkWinner.
	self assert: (gameInstance winner) equals: 'El Diego'.
]

{ #category : #tests }
DummyTest >> testUnJugadorJuegaUnaPartidaYGana [

   | gameBoard gameInstance elDiego dice aDiceList elDiegoDiceThrowResult |
	
	elDiego := Player withName: 'El Diego'.
   dice := Dice withSides: 6.
   gameBoard := Board withPositions: 1.
	
	aDiceList := { dice }.
	gameInstance := Game withPlayer: elDiego andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: aDiceList.
	gameInstance update: elDiego positionInBoardBy: elDiegoDiceThrowResult.
	
	gameInstance checkWinner.
	self assert: (gameInstance winner) equals: 'El Diego'.
	

	
]
