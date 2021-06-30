"
I am a SpeedUpPosition.
"
Class {
	#name : #SpeedUpPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'board effect' }
SpeedUpPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'board effect' }
SpeedUpPosition >> changeInPosition [
	^4
]
