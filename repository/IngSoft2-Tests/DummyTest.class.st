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
DummyTest >> testAssertALoadedDiceAlwaysReturnsTheNumberItWasLoadedWith [
	"insertar pepardo"
	|elDiego  elDiegoDiceThrowResult loadedDice|
	
	elDiego := Player withName: 'El Diego'.
   loadedDice := LoadedDice withSides: 10.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice.

	self assert: elDiegoDiceThrowResult equals: 10.
	

	
	
	
	
]

{ #category : #tests }
DummyTest >> testAssertAPlayerRollsTwoLoadedDicesAndAdvancesTheSumOfTheTwoDices [
	"insertar pepardo"
	| gameBoard gameInstance elDiego loadedDice1 loadedDice2 aDiceList elDiegoDiceThrowResult aPlayerList |
	
	elDiego := Player withName: 'El Diego'.
   loadedDice1 := LoadedDice withSides: 6.
	loadedDice2 := LoadedDice withSides: 3.
	
   gameBoard := Board withPositions: 9.
	
	aDiceList := { loadedDice1 . loadedDice2  }.
	
	aPlayerList := { elDiego }.
	gameInstance := Game withPlayer: aPlayerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice1.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice2.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	self assert: ((gameInstance winner at:1) name )equals: 'El Diego'.
	

	
	
	
	
]

{ #category : #tests }
DummyTest >> testAssertThatTheGameIsntOver [
	"insertar pepardo"
	| gameBoard gameInstance elDiego loadedDice1 loadedDice2 aDiceList elDiegoDiceThrowResult aPlayerList |
	
	elDiego := Player withName: 'El Diego'.
   loadedDice1 := LoadedDice withSides: 6.
	loadedDice2 := LoadedDice withSides: 3.
	
   gameBoard := Board withPositions: 10.
	
	aDiceList := { loadedDice1 . loadedDice2  }.
	
	aPlayerList := { elDiego }.
	gameInstance := Game withPlayer: aPlayerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice1.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice2.
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	self assert: (gameInstance isFinished ) equals: false. 
	
]

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

   gameBoard := Board withPositions: 2.
    gameInstance := Game withPlayer: playerList andDice: diceList andBoard: gameBoard.

    elDiegoDiceThrowResult := elDiego rollDice: diceList.
    gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
    elDiegoDiceThrowResult := elDiego rollDice: diceList.
    gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.


    self assert: ((gameInstance winner at:1) name )equals: 'El Diego'.
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
	

	self assert: ((gameInstance winner at:1) name )equals: 'El Diego'.
]

{ #category : #tests }
DummyTest >> testThatElDiegoIsInPosition6AndNicoIsInPosition5 [
	"insertar pepardo"
	| gameBoard gameInstance playerList elDiego nico loadedDice2 ice loadedDice1 aDiceList elDiegoDiceThrowResult  	nicoDiceThrowResult nicoPosition elDiegoPosition|
	
	elDiego := Player withName: 'El Diego'.
	nico := Player withName: 'Nico'.
	
	loadedDice1 := LoadedDice withSides: 6.
   loadedDice2  := LoadedDice withSides: 5.

	aDiceList:= { loadedDice1 . loadedDice2 }.

   gameBoard := Board withPositions: 6.
	
	playerList := OrderedCollection  new.
	
	playerList add: elDiego.
	playerList add: nico.

	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice1 .
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	nicoDiceThrowResult := nico rollLoadedDice: loadedDice2 .
	gameInstance update: nico whoIsPlayer: 2 positionInBoardBy: nicoDiceThrowResult.
	
	elDiegoPosition := gameInstance getPositionOfPlayer: 1.
	nicoPosition := gameInstance getPositionOfPlayer: 2.

	self assert: ((elDiegoPosition == 6) and: (nicoPosition == 5))


]

{ #category : #tests }
DummyTest >> testThatTheGameHasFinished [
	"insertar pepardo"
	| gameBoard gameInstance playerList elDiego nico dice loadedDice aDiceList elDiegoDiceThrowResult  	nicoDiceThrowResult|
	
	elDiego := Player withName: 'El Diego'.
	nico := Player withName: 'Nico'.

   dice := Dice withSides: 5.
	loadedDice := LoadedDice withSides: 6.
	aDiceList:= { dice }.

   gameBoard := Board withPositions: 6.
	
	playerList := OrderedCollection  new.
	
	playerList add: elDiego.
	playerList add: nico.

	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice .
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	
	nicoDiceThrowResult := nico rollDice: aDiceList .
	gameInstance update: nico whoIsPlayer: 2 positionInBoardBy: nicoDiceThrowResult.


	self assert: (gameInstance isFinished) equals: true. 
]

{ #category : #tests }
DummyTest >> testTwoPlayersPlayTheGame [
	| gameBoard gameInstance playerList elDiego nico dice loadedDice aDiceList elDiegoDiceThrowResult  	nicoDiceThrowResult|
	
	elDiego := Player withName: 'El Diego'.
	nico := Player withName: 'Nico'.
	
   dice := Dice withSides: 5.
	loadedDice := LoadedDice withSides: 6.
	aDiceList:= { dice }.

   gameBoard := Board withPositions: 6.
	
	playerList := OrderedCollection  new.
	
	playerList add: elDiego.
	playerList add: nico.

	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice .
	gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.
	
	
	nicoDiceThrowResult := nico rollDice: aDiceList .
	gameInstance update: nico whoIsPlayer: 2 positionInBoardBy: nicoDiceThrowResult.

	self assert: ((gameInstance winner at:1) name )equals: 'El Diego'.

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
	

	self assert: ((gameInstance winner at:1) name )equals: 'El Diego'.
	

	
]
