Class {
	#name : #MultiplePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MultiplePlayerTests >> test01TwoPlayersPlayTheGame [
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
MultiplePlayerTests >> test02ThatTheGameHasFinished [
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
MultiplePlayerTests >> test03ThatElDiegoIsInPosition6AndNicoIsInPosition5 [
	"insertar pepardo"
	| gameBoard gameInstance playerList elDiego nico loadedDice2 loadedDice1 aDiceList elDiegoDiceThrowResult  	nicoDiceThrowResult nicoPosition elDiegoPosition|
	
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
MultiplePlayerTests >> test04FivePlayersPlayTheGameAndSebaWins [
	| gameBoard gameInstance playerList playerNico playerRama playerSeba playerJorge playerJulian dice loadedDice aDiceList playerDiceThrowResult|
	
	playerNico := Player withName: 'Nico'.
	playerRama := Player withName: 'Rama'.
	playerSeba := Player withName: 'Seba'.
	playerJorge := Player withName: 'Jorge'.
	playerJulian := Player withName: 'Julian'.
	
   dice := Dice withSides: 5.
	loadedDice := LoadedDice withSides: 50.
	aDiceList:= { dice }.

   gameBoard := Board withPositions: 50.
	
	playerList := OrderedCollection  new.
	
	playerList add: playerNico.
	playerList add: playerRama.
	playerList add: playerSeba.
	playerList add: playerJorge.
	playerList add: playerJulian.
	
	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	"Round 1:"
	playerDiceThrowResult  := playerNico rollDice: aDiceList.
	gameInstance update: playerNico whoIsPlayer: 1 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerRama rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 2 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerSeba rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 3 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJorge rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 4 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJulian rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 5 positionInBoardBy: playerDiceThrowResult.
	
	"Round 2:"
	playerDiceThrowResult  := playerNico rollDice: aDiceList.
	gameInstance update: playerNico whoIsPlayer: 1 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerRama rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 2 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerSeba rollLoadedDice: loadedDice .
	gameInstance update: playerRama whoIsPlayer: 3 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJorge rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 4 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJulian rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 5 positionInBoardBy: playerDiceThrowResult.

	self assert: ((gameInstance winner at:1) name) equals: (playerSeba name).

]

{ #category : #tests }
MultiplePlayerTests >> test05FivePlayersPlayTheGameAndNoOneWins [
	| gameBoard gameInstance playerList playerNico playerRama playerSeba playerJorge playerJulian dice loadedDice aDiceList playerDiceThrowResult|
	
	playerNico := Player withName: 'Nico'.
	playerRama := Player withName: 'Rama'.
	playerSeba := Player withName: 'Seba'.
	playerJorge := Player withName: 'Jorge'.
	playerJulian := Player withName: 'Julian'.
	
   dice := Dice withSides: 5.
	loadedDice := LoadedDice withSides: 50.
	aDiceList:= { dice }.

   gameBoard := Board withPositions: 50.
	
	playerList := OrderedCollection  new.
	
	playerList add: playerNico.
	playerList add: playerRama.
	playerList add: playerSeba.
	playerList add: playerJorge.
	playerList add: playerJulian.
	
	gameInstance := Game withPlayer: playerList andDice: aDiceList andBoard: gameBoard.

	"Round 1:"
	playerDiceThrowResult  := playerNico rollDice: aDiceList.
	gameInstance update: playerNico whoIsPlayer: 1 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerRama rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 2 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerSeba rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 3 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJorge rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 4 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJulian rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 5 positionInBoardBy: playerDiceThrowResult.
	
	"Round 2:"
	playerDiceThrowResult  := playerNico rollDice: aDiceList.
	gameInstance update: playerNico whoIsPlayer: 1 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerRama rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 2 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerSeba rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 3 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJorge rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 4 positionInBoardBy: playerDiceThrowResult.
	
	playerDiceThrowResult  := playerJulian rollDice: aDiceList .
	gameInstance update: playerRama whoIsPlayer: 5 positionInBoardBy: playerDiceThrowResult.

	self assert: (gameInstance winner isEmpty).

]
