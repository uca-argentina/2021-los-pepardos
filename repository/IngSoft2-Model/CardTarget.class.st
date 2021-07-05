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

{ #category : #'as yet unclassified' }
CardTarget >> card [
	^ card
]

{ #category : #'as yet unclassified' }
CardTarget >> initializeAfter: aCard wasTargettedOn: aPlayerName [
	card := aCard.
	playerName := aPlayerName.
]

{ #category : #'as yet unclassified' }
CardTarget >> playerName [
	^ playerName
]
