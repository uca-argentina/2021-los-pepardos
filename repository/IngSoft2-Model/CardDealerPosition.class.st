Class {
	#name : #CardDealerPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardDealerPosition >> amountOf: aString [ 
	aString = 'CardDealer'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
CardDealerPosition >> applyEffectTo: aPlayerStatus afterLandingOn: aCardDealerPosition withARollOf: anInteger onGame: anIngSoft2Game [ 
	aPlayerStatus hand addNewCard.
]
