Class {
	#name : #OnePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
OnePlayerTests >> test01OnePlayerRollsOneDiceTwice [
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
OnePlayerTests >> test02UnElDiegoPlaysAGameAndWins [

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

{ #category : #tests }
OnePlayerTests >> test03OnePlayerWithTwoDicesWinTheGame [
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
OnePlayerTests >> test04AssertThatTheGameIsntOver [
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
OnePlayerTests >> test05AssertALoadedDiceAlwaysReturnsTheNumberItWasLoadedWith [
    "insertar pepardo"
    |elDiego  elDiegoDiceThrowResult loadedDice|

    elDiego := Player withName: 'El Diego'.
   loadedDice := LoadedDice withSides: 10.

    elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice.

    self assert: elDiegoDiceThrowResult equals: 10.
]

{ #category : #tests }
OnePlayerTests >> test06APlayerRollsALoadedDiceAndDoesNotWinTheGame [
	"insertar pepardo"
    | gameBoard gameInstance elDiego loadedDice elDiegoDiceThrowResult playerList |

    elDiego := Player withName: 'El Diego'.
   	 loadedDice := LoadedDice withSides: 7.

    playerList := { elDiego }.

    gameBoard := Board withPositions: 10.
    gameInstance := Game withPlayer: playerList andDice: loadedDice andBoard: gameBoard.

    elDiegoDiceThrowResult := elDiego rollLoadedDice: loadedDice .
    gameInstance update: elDiego whoIsPlayer: 1 positionInBoardBy: elDiegoDiceThrowResult.

    self assert: (((gameInstance player) at:1) at:2) equals: 7
]

{ #category : #tests }
OnePlayerTests >> test07AssertAPlayerRollsTwoLoadedDicesAndAdvancesTheSumOfTheTwoDices [
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
