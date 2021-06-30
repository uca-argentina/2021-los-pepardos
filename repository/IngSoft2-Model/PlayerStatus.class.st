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

{ #category : #adding }
PlayerStatus >> addToCardPlayedHistory: aCard [ 
	cardHistory add: aCard
]

{ #category : #'as yet unclassified' }
PlayerStatus >> applyRedoCardEffectOn: aGame [ 
	
	|reversedCardHistory lastPermanentCardPlayed |
	reversedCardHistory := self cardHistory reverse.
	lastPermanentCardPlayed := reversedCardHistory detect: [ :card | card isPermanent ].
	aGame play: lastPermanentCardPlayed on: self.
]

{ #category : #accessing }
PlayerStatus >> cardHistory [
	^ cardHistory
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
	activeEffects := OrderedCollection new.
	activeBoost := 0.
	cardHistory := OrderedCollection new.
	
]

{ #category : #accessing }
PlayerStatus >> lap [
	^ lap
]

{ #category : #accessing }
PlayerStatus >> lastCardPlayed [

	| lastCardPlayed |
	lastCardPlayed := hand cards reverse.
	lastCardPlayed := lastCardPlayed detect: [ :card | card isPermanent ].
	^lastCardPlayed
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

{ #category : #removing }
PlayerStatus >> removeActiveEffectOf: aCardType [ 

	| effectToDelete |
	effectToDelete := (activeEffects detect: [:card | (card type) = aCardType]).
	activeEffects remove: effectToDelete.
	^effectToDelete

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
