Class {
	#name : #PlayerStatus,
	#superclass : #Object,
	#instVars : [
		'player',
		'position',
		'lap',
		'hand',
		'activeEffects',
		'activeBoost'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PlayerStatus class >> of: aPlayer with: position at: laps [
	^self new initializeOf: aPlayer with: position at: laps
]

{ #category : #'as yet unclassified' }
PlayerStatus >> activeBoost [
	^activeBoost
]

{ #category : #'as yet unclassified' }
PlayerStatus >> activeEffects [
	^activeEffects
]

{ #category : #'as yet unclassified' }
PlayerStatus >> activeEffectsAdd: aCard [
	activeEffects add: aCard
]

{ #category : #'as yet unclassified' }
PlayerStatus >> correctLapBy: aNumber [
	lap := lap + aNumber
]

{ #category : #'as yet unclassified' }
PlayerStatus >> correctPositionBy: aCorrection [
	position := position - aCorrection.
]

{ #category : #'as yet unclassified' }
PlayerStatus >> hand [
	^ hand
]

{ #category : #'as yet unclassified' }
PlayerStatus >> initializeOf: aPlayer with: aPosition at: aLap [
	player := aPlayer.
	position := aPosition.
	lap := aLap.
	hand := Hand withRandomCards: 2.
	activeEffects := OrderedCollection new.
	activeBoost := 0.
	
]

{ #category : #'as yet unclassified' }
PlayerStatus >> lap [
	^ lap
]

{ #category : #'as yet unclassified' }
PlayerStatus >> modifyActiveBoostBy: aNumber [ 
	activeBoost := activeBoost + aNumber
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
PlayerStatus >> removeActiveEffectOf: aCardType [ 

	| effectToDelete |
	effectToDelete := (activeEffects detect: [:card | (card type) = aCardType]).
	activeEffects remove: effectToDelete.
	^effectToDelete

]

{ #category : #'as yet unclassified' }
PlayerStatus >> removeCardOf: aCardType [
	^(hand removeCardOf: aCardType)
]

{ #category : #'as yet unclassified' }
PlayerStatus >> updateBasicPositionTo: newPosition andLapsTo: newLap [ 
	position := newPosition.
	lap := newLap.
]

{ #category : #'as yet unclassified' }
PlayerStatus >> updatePositionTo: aNumber [ 
	position := aNumber.
]
