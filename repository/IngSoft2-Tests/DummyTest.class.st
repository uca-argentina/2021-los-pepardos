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
DummyTest >> testOnePlayerRollsOneDiceTwice [
    "insertar pepardo"
    | gameBoard gameInstance elDiego dice1  diceList elDiegoDiceThrowResult playerList |

    elDiego := Player withName: 'El Diego'.
   dice1 := Dice withSides: 6.

    diceList := { dice1 }.
    playerList := { elDiego }.

   gameBoard := Board withPositions: 5.
    gameInstance := Game withPlayer: playerList andDice: diceList andBoard: gameBoard.

    elDiegoDiceThrowResult := elDiego rollDice: diceList.
    gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
    elDiegoDiceThrowResult := elDiego rollDice: diceList.
    gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.

    gameInstance checkWinner.
    self assert: (gameInstance winner name) equals: 'El Diego'.
]

{ #category : #tests }
DummyTest >> testOnePlayerWithTwoDicesWinTheGame [
	"insertar pepardo"
	| gameBoard gameInstance elDiego dice1 dice2 diceList elDiegoDiceThrowResult playerList |
	
	elDiego := Player withName: 'El Diego'.
   dice1 := Dice withSides: 6.
	dice2 := Dice withSides: 3.	
	diceList := { dice1 . dice2 }.
	playerList := { elDiego }.
	
   gameBoard := Board withPositions: 2.
	gameInstance := Game withPlayer: playerList andDice: diceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: diceList.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	gameInstance checkWinner.
	self assert: (gameInstance winner name) equals: 'El Diego'.
]

{ #category : #tests }
DummyTest >> testTwoPlayersPlayTheGame [
	| gameBoard gameInstance playerList elDiego nico dice  aDiceList elDiegoDiceThrowResult  	nicoDiceThrowResult|
	
	elDiego := Player withName: 'El Diego'.
	nico := Player withName: 'Nico'.
	
   dice := Dice withSides: 6.
	aDiceList:= { dice }.

   gameBoard := Board withPositions: 2.
	
	playerList := OrderedCollection  new.
	
	playerList add: elDiego.
	playerList add: nico.

	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: aDiceList .
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	
	nicoDiceThrowResult := nico rollDice: aDiceList .
	gameInstance update: nico whoIsPlayer: 2 positionInBoardBy: nicoDiceThrowResult.

	
	gameInstance checkWinner.
	self assert: (gameInstance winner name) equals: 'El Diego'.

]

{ #category : #tests }
DummyTest >> testUnJugadorJuegaUnaPartidaYGana [

   | gameBoard gameInstance elDiego dice aDiceList elDiegoDiceThrowResult aPlayerList |
	
	elDiego := Player withName: 'El Diego'.
   dice := Dice withSides: 6.
   gameBoard := Board withPositions: 1.
	
	aDiceList := { dice }.
	aPlayerList := { elDiego }.
	gameInstance := Game withPlayer: aPlayerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollDice: aDiceList.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	gameInstance checkWinner.
	self assert: (gameInstance winner name) equals: 'El Diego'.
	

	
]
