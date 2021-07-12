"
I am a playerStatus. 
I know certain information about the player.
"
Class {
	#name : #PlayerStatus,
	#superclass : #Object,
	#instVars : [
		'player',
		'position',
		'lap',
		'hand',
		'activeEffects',
		'activeBoost',
		'cardHistory'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PlayerStatus class >> of: aPlayer with: position at: laps [
	^self new initializeOf: aPlayer with: position at: laps
]

{ #category : #accessing }
PlayerStatus >> activeBoost [
	^activeBoost
]

{ #category : #accessing }
PlayerStatus >> activeEffects [
	^activeEffects
]

{ #category : #adding }
PlayerStatus >> activeEffectsAdd: aCard [
	activeEffects add: aCard
]

{ #category : #asserting }
PlayerStatus >> assertHas: aCard [ 
	((self hand cards) includes: aCard) 
		ifFalse: [ Error signal: 'Player doesnt own that card' ]
]

{ #category : #'lap management' }
PlayerStatus >> correctLapBy: aNumber [
	lap := lap + aNumber
]

{ #category : #'position management' }
PlayerStatus >> correctPositionBy: aCorrection [
	position := position - aCorrection.
]

{ #category : #accessing }
PlayerStatus >> hand [
	^ hand
]

{ #category : #initialization }
PlayerStatus >> initializeOf: aPlayer with: aPosition at: aLap [
	player := aPlayer.
	position := aPosition.
	lap := aLap.
	hand := Hand withRandomCards: 2.
"	hand := Hand obtainingCardsFrom: deck."
	activeEffects := OrderedCollection new.
	activeBoost := 0.
	cardHistory := OrderedCollection new.
	
]

{ #category : #accessing }
PlayerStatus >> lap [
	^ lap
]

{ #category : #'boost management' }
PlayerStatus >> modifyActiveBoostBy: aBModificationInBoost [
	activeBoost := activeBoost + aBModificationInBoost
]

{ #category : #accessing }
PlayerStatus >> player [
	^ player
]

{ #category : #accessing }
PlayerStatus >> position [
	^ position
]

{ #category : #removing }
PlayerStatus >> remove: aCardType [
	^(hand remove: aCardType)
]

{ #category : #'position management' }
PlayerStatus >> updatePositionTo: aNumber [ 
	position := aNumber.
]

{ #category : #'position management' }
PlayerStatus >> updatePositionTo: newPosition andLapsTo: newLap [ 
	position := newPosition.
	lap := newLap.
]
