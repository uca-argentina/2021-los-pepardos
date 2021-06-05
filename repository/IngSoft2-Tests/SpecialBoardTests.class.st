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

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 100.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game winnerName) equals: elDiego.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test003ElDiegoLandsInASpeedUpBoardPositionAndAdvances4Positions [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 50.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self assert: (game positionOf: elDiego) equals: 55.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test004ElDiegoLandsInANonEffectBoardPositionAndStaysInTheSamePlace [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 2.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self assert: (game positionOf: elDiego) equals: 3.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test005APlayerLandsInNukeAndMakesAllPlayersGoToPosition1 [

   | gameBoard game elDiego elSeba elNico diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elSeba := 'El Seba'.
	elNico := 'El Nico'.
   diceOne := LoadedDice rolling: 99.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elDiego . elSeba . elNico }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self assert: (game positionOf: elDiego) equals: 1.
	self assert: (game positionOf: elNico) equals: 1.
	self assert: (game positionOf: elSeba) equals: 1.
]

{ #category : #tests }
SpecialBoardTests >> test006ElDiegoLandsInAWormHoleAndGoesBack4Positions [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 70.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self assert: (game positionOf: elDiego) equals: 67.

]

{ #category : #tests }
SpecialBoardTests >> test007ElDiegoLandsInTheFirstMoonWalkPositionAndTakesElPeleBack1Space [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 89.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elPele . elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playTurn.

	self assert: (game positionOf: elDiego) equals: 84.

]
