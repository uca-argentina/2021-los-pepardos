Class {
	#name : #ObjectCreation,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ObjectCreation >> test001DiceCannotHaveLessThan3Sides [

   self should: [Dice withSides: 2] raise: Error whoseDescriptionIncludes: 'Sides must be >= 3' description: 'Banana'.
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
