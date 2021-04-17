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
DummyTest >> testTwoPlayersPlayTheGame [
	| gameBoard gameInstance playerList elDiego roman dice aDiceList elDiegoDiceThrowResult  		romanDiceThrowResult|
	
	elDiego := Player withName: 'El Diego'.
	roman := Player withName: 'Roman'.
	
   dice := Dice withSides: 6.
	aDiceList := { dice }.
   gameBoard := Board withPositions: 1.
	
	playerList := OrderedCollection  new.
	
	playerList add: elDiego.
	playerList add: roman.

	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: aDiceList.
	gameInstance update: elDiego positionInBoardBy: elDiegoDiceThrowResult.
	
	
	romanDiceThrowResult := roman rollDice: aDiceList.
	gameInstance update: roman positionInBoardBy: romanDiceThrowResult.

	
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
