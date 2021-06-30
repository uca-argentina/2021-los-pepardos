Class {
	#name : #SpeedUpPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedUpPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'as yet unclassified' }
SpeedUpPosition >> changeInPosition [
	^4
]
