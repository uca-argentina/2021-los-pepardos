"
I am a CardTarget.
I link a player to a card.
"
Class {
	#name : #CardTarget,
	#superclass : #Object,
	#instVars : [
		'card',
		'playerName'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardTarget class >> targetting: aCard from: aPlayerName [
	^self new initializeAfter: aCard wasTargettedOn: aPlayerName.
]

{ #category : #accessing }
CardTarget >> card [
	^ card
]

{ #category : #initialization }
CardTarget >> initializeAfter: aCard wasTargettedOn: aPlayerName [
	card := aCard.
	playerName := aPlayerName.
]

{ #category : #accessing }
CardTarget >> playerName [
	^ playerName
]
