Class {
	#name : #WormHolePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormHolePosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger.
]

{ #category : #'as yet unclassified' }
WormHolePosition >> changeInPosition [
	^-4
]
