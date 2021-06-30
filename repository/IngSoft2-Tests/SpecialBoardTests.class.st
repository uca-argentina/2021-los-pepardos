Class {
	#name : #SpecialBoardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpecialBoardTests >> test001ElDiegoPlaysAGameWhereTheBoardHasSpecialEffectsAndWins [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game winnerName) equals: elDiego.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test002ElDiegoLandsInASpeedUpBoardPositionAndAdvances4Positions [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self assert: (game positionOf: elDiego) equals: 6.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test003ElDiegoLandsInANonEffectBoardPositionAndStaysInTheSamePlace [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := Player withName: 'El Diego'.
   diceOne := LoadedDice rolling: 2.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self assert: (game positionOf: elDiego) equals: 3.

	

	

	
]

{ #category : #tests }
SpecialBoardTests >> test004APlayerLandsInNukeAndMakesAllPlayersGoToPosition1 [

   | gameBoard game elDiego elSeba elNico diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elSeba := 'El Seba'.
	elNico := 'El Nico'.
   diceOne := LoadedDice rolling: 3.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NukePosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego . elSeba . elNico }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self assert: (game positionOf: elDiego) equals: 1.
	self assert: (game positionOf: elNico) equals: 1.
	self assert: (game positionOf: elSeba) equals: 1.
]

{ #category : #tests }
SpecialBoardTests >> test005ElDiegoLandsInAWormHoleAndGoesBackToPosition1 [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 4.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self assert: (game positionOf: elDiego) equals: 1.

]

{ #category : #tests }
SpecialBoardTests >> test006ElDiegoLandsInTheFirstMoonWalkPositionAndTakesElPeleBack1Space [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 2.
   gameBoard := Board with: { NonEffectPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 }.
	
	dices := { diceOne }.
	players := { elPele . elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self assert: (game positionOf: elDiego) equals: 2.
	self assert: (game lapsCompletedBy: elPele) equals: 0.

]
