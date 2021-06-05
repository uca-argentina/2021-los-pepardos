Class {
	#name : #NukePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
NukePosition >> amountOf: aString [ 
	aString = 'Nuke'
	ifTrue: [ ^1 ].
	^0.
]

{ #category : #'as yet unclassified' }
NukePosition >> applyEffectTo: aPlayerStatus afterLandingOn: aNukePosition withARollOf: anInteger onGame: anIngSoft2Game [ 

	anIngSoft2Game applyNukeEffectTo: aPlayerStatus. 
]
