Class {
	#name : #WormHolePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormHolePosition >> amountOf: aString [ 
	aString = 'WormHole'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
WormHolePosition >> applyEffectTo: aPlayerStatus afterLandingOn: aWormHolePosition withARollOf: anInteger onGame: anIngSoft2Game [ 

	anIngSoft2Game applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'as yet unclassified' }
WormHolePosition >> changeInPosition [
	^-4
]
