Class {
	#name : #SinglePlayerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SinglePlayerTests >> test001ElDiegoPlaysAndWins [

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
SinglePlayerTests >> test002ElDiegoPlaysWithTwoDicesAndWins [
	| gameBoard game diceOne dices players lapsToWin |
	
	diceOne := Dice withSides: 3.
	diceOne := Dice withSides: 4.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . SpeedUpPosition new }.
	
	dices := {diceOne}.
	players := {'El Diego'}.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard	wherePlayersNeedToComplete: lapsToWin.
		
	game playGame.
	self assert: game winnerName equals: 'El Diego'
]

{ #category : #tests }
SinglePlayerTests >> test003ElDiegoPlaysOneTurnAndDoesntWin [

   | gameBoard game elDiego diceOne dices players lapsToWin |
	
	elDiego := Player withName: 'El Diego'.
   diceOne := Dice withSides: 3.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playRound.

	self deny: game hasFinished.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test004ElDiegoBeingsPlayingAtPosition1 [

   | gameBoard game elDiego diceOne dices players lapsToWin |
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (game positionOf: elDiego) equals: 1.
	self assert: (game lapsCompletedBy: elDiego) equals: 0.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test005ElDiegoPlaysAGameWithALoadedAndANormalDiceAndWins [

   | gameBoard game elDiego normalDice loadedDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 3.
	loadedDice := LoadedDice rolling: 4.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { normalDice . loadedDice }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game winnerName) equals: elDiego.

	

	
]

{ #category : #tests }
SinglePlayerTests >> test006ElDiegoPlaysAGameAndIsOnLap3WhenGameIsDone [

   | gameBoard game elDiego normalDice dices players lapsToWin |
	
	elDiego := 'El Diego'.
   normalDice := Dice withSides: 6.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { normalDice }.
	players := { elDiego }.
	lapsToWin := 3.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	game playGame.

	self assert: (game lapsCompletedBy: elDiego) equals: 3.

	

	
]
