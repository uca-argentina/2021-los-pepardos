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

{ #category : #'as yet unclassified' }
BoardPositionStatus >> initializeWith: aNumber andEffect: anEffectPosition [
	number := aNumber.
	positionEffect := anEffectPosition.
]

{ #category : #'as yet unclassified' }
BoardPositionStatus >> positionEffect [
	^ positionEffect
]
