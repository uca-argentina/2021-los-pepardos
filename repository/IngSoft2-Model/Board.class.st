Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'positions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> withPositions: aNumberOfPositions [
	^self new initializeWithPositions: aNumberOfPositions.
]

{ #category : #'instance creation' }
Board >> initializeWithPositions: aNumberOfPositions [
	positions := aNumberOfPositions.
]
