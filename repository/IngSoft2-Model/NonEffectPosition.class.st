Class {
	#name : #NonEffectPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
NonEffectPosition >> * aNumber [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
NonEffectPosition >> amountOf: aString [ 
	aString = 'NonEffect'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
NonEffectPosition >> applyEffectTo: aPlayerStatus afterLandingOn: aNonEffectPosition withARollOf: anInteger onGame: anIngSoft2Game [ 

	anIngSoft2Game applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'as yet unclassified' }
NonEffectPosition >> changeInPosition [
	^0
]
