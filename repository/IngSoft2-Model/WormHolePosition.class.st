"
I am a WormHolePosition
"
Class {
	#name : #WormHolePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'board effect' }
WormHolePosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger.
]

{ #category : #'board effect' }
WormHolePosition >> changeInPosition [
	^-4
]
