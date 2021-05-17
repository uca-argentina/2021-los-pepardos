Class {
	#name : #SpecialBoardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpecialBoardTests >> test001ANewBoardOf100PositionsHasTheCorrectDistributionOfEffects [

   | gameBoard |
	
   gameBoard := Board withPositions: 100.
	
	self assert: (gameBoard numberOfNonEffects) equals: 48.
	self assert: (gameBoard numberOfWormHole) equals: 20.
	self assert: (gameBoard numberOfSpeedUp) equals: 20.
	self assert: (gameBoard numberOfMoonWalk) equals: 10.
	self assert: (gameBoard numberOfNuke) equals: 2.

	

	
]

{ #category : #tests }
SpecialBoardTests >> test002ElDiegoPlaysAGameWhereTheBoardHasSpecialEffectsAndWins [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playGame.

	self assert: (gameInstance winner) equals: elDiego.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test003ElDiegoLandsInASpeedUpBoardPositionAndAdvances4Positions [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self assert: (gameInstance positionOf: elDiego) equals: 6.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test004ElDiegoLandsInANonEffectBoardPositionAndStaysInTheSamePlace [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 2.
   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self assert: (gameInstance positionOf: elDiego) equals: 3.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test005APlayerLandsInNukeAndMakesAllPlayersGoToPosition1 [

   | gameBoard gameInstance elDiego elSeba elNico diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
	elSeba := Player withName: 'El Seba'.
	elNico := Player withName: 'El Nico'.
   diceOne := LoadedDice rolling: 3.
   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego . elSeba . elNico }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self assert: (gameInstance positionOf: elDiego) equals: 1.
	self assert: (gameInstance positionOf: elNico) equals: 1.
	self assert: (gameInstance positionOf: elSeba) equals: 1.
]

{ #category : #tests }
SpecialBoardTests >> test006ElDiegoLandsInAWormHoleAndGoesBack4Positions [

   | gameBoard gameInstance elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 4.
   gameBoard := LoadedBoard withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	gameInstance := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	gameInstance playTurn.

	self assert: (gameInstance positionOf: elDiego) equals: 1.

]
