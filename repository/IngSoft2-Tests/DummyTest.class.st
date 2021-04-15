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

   | playerOne playerList diceOne diceList gameBoard gameInstance  diceMovementResult |
	
	playerOne := Player withName: 'El Diego'.
   playerList := { playerOne }.

   diceOne := Dice  withSides: 6.
   diceList := { diceOne }.

   gameBoard := Board withPositions: 1.
	gameInstance := Game withPlayers: playerList withDices: diceList withBoard: gameBoard.
	
	diceMovementResult := playerOne rollDice: diceList.
	gameInstance movePlayer: playerOne byTheAmountOfPositions: diceMovementResult.
	
	self assert: (gameInstance winner) equals: 'El Diego'.

	
]
