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
