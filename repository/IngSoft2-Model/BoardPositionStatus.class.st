"
I am a BoardPositionStatus
I am made up of a number and an effect.
"
Class {
	#name : #BoardPositionStatus,
	#superclass : #Object,
	#instVars : [
		'number',
		'positionEffect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardPositionStatus class >> withNumber: aNumber andEffect: anEffect [
	^self new initializeWith: aNumber andEffect: anEffect.
]

{ #category : #initialization }
BoardPositionStatus >> initializeWith: aNumber andEffect: anEffectPosition [
	number := aNumber.
	positionEffect := anEffectPosition.
]

{ #category : #accessing }
BoardPositionStatus >> positionEffect [
	^ positionEffect
]
