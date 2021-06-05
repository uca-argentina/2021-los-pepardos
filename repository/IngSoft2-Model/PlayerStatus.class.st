Class {
	#name : #PlayerStatus,
	#superclass : #Object,
	#instVars : [
		'player',
		'position',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PlayerStatus class >> of: aPlayer with: position at: laps [
	^self new initializeOf: aPlayer with: position at: laps
]

{ #category : #'as yet unclassified' }
PlayerStatus >> correctPositionBy: aCorrection [
	position := position - aCorrection.
]

{ #category : #'as yet unclassified' }
PlayerStatus >> initializeOf: aPlayer with: aPosition at: aLap [
	player := aPlayer.
	position := aPosition.
	lap := aLap.
	
]

{ #category : #'as yet unclassified' }
PlayerStatus >> lap [
	^ lap
]

{ #category : #'as yet unclassified' }
PlayerStatus >> player [
	^ player
]

{ #category : #'as yet unclassified' }
PlayerStatus >> position [
	^ position
]

{ #category : #'as yet unclassified' }
PlayerStatus >> updateLapsTo: aNewAmountOfLaps [
	lap := aNewAmountOfLaps.
]

{ #category : #'as yet unclassified' }
PlayerStatus >> updatePositionTo: aNumber [ 
	position := aNumber.
]

{ #category : #'as yet unclassified' }
PlayerStatus >> updatePositionTo: newPosition andLapsTo: newLap [ 
	position := newPosition.
	lap := newLap.
]
