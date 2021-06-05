Class {
	#name : #MoonWalkPosition,
	#superclass : #Object,
	#instVars : [
		'n'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MoonWalkPosition class >> withN: anN [
	^self new initializeWithN: anN.
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> amountOf: aString [ 
	aString = 'MoonWalk'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> applyEffectTo: aPlayerStatus afterLandingOn: aMoonWalkPosition withARollOf: anInteger onGame: anIngSoft2Game [ 
	
	anIngSoft2Game applyMoonwalkEffectTo: aPlayerStatus afterLandingOn: aMoonWalkPosition. 
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> initializeWithN: anN [
	n := anN.
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> n [
	^ n
]
