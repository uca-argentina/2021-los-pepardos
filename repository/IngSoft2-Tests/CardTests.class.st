Class {
	#name : #CardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTests >> test001ANewBoardHasTheCorrectNumberOfEffects [

   | gameBoard |
	
	gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . CardDealerPosition new . NonEffectPosition new . WormHolePosition new . NukePosition new }.
	
	self assert: (gameBoard numberOf: 'NonEffect') equals: 3.
	self assert: (gameBoard numberOf: 'CardDealer') equals: 1.
	self assert: (gameBoard numberOf: 'WormHole') equals: 1.
	self assert: (gameBoard numberOf: 'SpeedUp') equals: 1.
	self assert: (gameBoard numberOf: 'MoonWalk') equals: 1.
	self assert: (gameBoard numberOf: 'Nuke') equals: 1.


]

{ #category : #tests }
CardTests >> test002ElDiegoBeginsPlayingWith2Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (game amounfOfCardsOf: elDiego) equals: 2. "replace amountOfCardsOf to cards -> size"


]

{ #category : #tests }
CardTests >> test003ElDiegoLandsInACardDealerPositionAndNowHas3Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 4.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . CardDealerPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.

	self assert: (game amounfOfCardsOf: elDiego) equals: 3.


]
