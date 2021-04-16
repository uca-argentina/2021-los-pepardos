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
DummyTest >> testUnJugadorJuegaUnaPartidaYGana [

   | gameBoard gameInstance elDiego dice elDiegoDiceThrowResult |
	
	elDiego := Player withName: 'El Diego'.
   dice := Dice withSides: 6.
   gameBoard := Board withPositions: 1.

	gameInstance := Game withPlayer: elDiego andDice: dice andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: dice.
	gameInstance update: elDiego positionInBoardBy: elDiegoDiceThrowResult.
	
	self assert: (gameInstance winner) equals: 'El Diego'.

	
]
