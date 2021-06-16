Class {
	#name : #ObjectCreation,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ObjectCreation >> test001DiceCannotHaveLessThan3Sides [

   self should: [Dice withSides: 2] raise: Error whoseDescriptionIncludes: 'Sides must be >= 3' description: 'Dice must have > 3 sides'.
																								"sides > 3"           "lo usa pharo cuando falla el test"
]

{ #category : #tests }
ObjectCreation >> test002GameMustHaveMoreThan0Players [

   self should: [ IngSoft2Game beingPlayedBy: {} 
										with: (Dice withSides: 3) 
										on: (Board with: { NonEffectPosition new . WormHolePosition new }) 
										wherePlayersNeedToComplete: 1 ] 
									
		raise: Error whoseDescriptionIncludes: 'Game must have at least one player' description: 'Players must be >= than 1'.


	
]

{ #category : #tests }
ObjectCreation >> test003GameMustHaveMoreThan1LapToComplete [

   self should: [ IngSoft2Game beingPlayedBy: {'El Diego'} 
										with: (Dice withSides: 3) 
										on: (Board with: { NonEffectPosition new . WormHolePosition new }) 
										wherePlayersNeedToComplete: -2 ] 
									
		raise: Error whoseDescriptionIncludes: 'Game must have more than one lap' description: 'Laps must be >= than 1'.


	
]

{ #category : #tests }
ObjectCreation >> test004BoardMustHaveMoreThanTwoPositions [

   self should: [ Board with: {NonEffectPosition new} ] 
        raise: Error whoseDescriptionIncludes: 'Board has less than 2 positions' description: 'Board must have more than one position'.


	
]

{ #category : #tests }
ObjectCreation >> test005MoonWalkNMustBeGreaterThan0 [

   self should: [ MoonWalkPosition withN: 0 ] 
        raise: Error whoseDescriptionIncludes: 'N in Moonwalk must be > 0' description: 'MoonWalkPosition N must be > 0'.


	
]

{ #category : #tests }
ObjectCreation >> test006AHandBeCreatedWithMoreOrEqualsThan1Card [

   self should: [ Hand withRandomCards: 0 ]
        raise: Error whoseDescriptionIncludes: 'Amount of cards must be > 0' description: 'A Hand must be initialized with more than 0 cards'.


	
]

{ #category : #tests }
ObjectCreation >> test007APlayerCannotPlayTheGameAfterItHasFinished [
		
	| gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego}.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playGame.
	self should: [ game playTurn ]
   		raise: Error whoseDescriptionIncludes: 'The game has already finished' description: 'Sent playTurn after the game finished'.
]

{ #category : #tests }
ObjectCreation >> test008APlayerCannotPlayACardThatHeDoesntHave [
		
	| gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	self should: [ game make: elDiego useCard: 'Sunny' on: elDiego ]
   		raise: Error whoseDescriptionIncludes: 'Player doesnt own that card' description: 'Player doesnt own this card'.
]

{ #category : #tests }
ObjectCreation >> test009ACardCannotBeUsedOnAnIncorrectPlayer [
		
	| gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: CancellationCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	self should: [ game make: elDiego useCard: 'Cancellation' on: elDiego toRemove: 'Speed' ]
   		raise: Error whoseDescriptionIncludes: 'Player has no such active effect' description: 'Player has no such active effect'.
]
