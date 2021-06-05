Class {
	#name : #SpeedUpPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedUpPosition >> amountOf: aString [ 
	aString = 'SpeedUp'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
SpeedUpPosition >> applyEffectTo: aPlayerStatus afterLandingOn: aSpeedUpPosition withARollOf: anInteger onGame: anIngSoft2Game [ 

	anIngSoft2Game applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'as yet unclassified' }
SpeedUpPosition >> changeInPosition [
	^4
]
