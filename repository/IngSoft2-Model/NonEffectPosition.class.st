"
I am a NonEffectPosition.
I know how to apply my own non effect position effect.
"
Class {
	#name : #NonEffectPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'board effect' }
NonEffectPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger.
]

{ #category : #'board effect' }
NonEffectPosition >> changeInPosition [
	^0
]
