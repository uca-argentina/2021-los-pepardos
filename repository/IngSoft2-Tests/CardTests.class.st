Class {
	#name : #CardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTests >> test001ANewBoardOf100PositionsNowHas10LessNonEffectAnd10MoreCardDealer [

   | gameBoard |
	
   gameBoard := Board withPositions: 100.
	
	self assert: (gameBoard numberOf: 'NonEffect') equals: 38.
	self assert: (gameBoard numberOf: 'CardDealer') equals: 10.
	self assert: (gameBoard numberOf: 'WormHole') equals: 20.
	self assert: (gameBoard numberOf: 'SpeedUp') equals: 20.
	self assert: (gameBoard numberOf: 'MoonWalk') equals: 10.
	self assert: (gameBoard numberOf: 'Nuke') equals: 2.


]

{ #category : #tests }
CardTests >> test002ElDiegoBeginsPlayingWith2Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board withPositions: 200.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (game amounfOfCardsOf: elDiego) equals: 2.


]

{ #category : #tests }
CardTests >> test003ElDiegoLandsInACardDealerPositionAndNowHas3Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 90.
   gameBoard := Board withLoadedPositions.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.

	self assert: (game amounfOfCardsOf: elDiego) equals: 3.


]
