Class {
	#name : #Hand,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Hand class >> assertValidAmountOfCards: anAmountOfCards [
	anAmountOfCards > 1
		ifFalse: [ Error signal: 'Amount of cards must be > 0' ] 
]

{ #category : #'as yet unclassified' }
Hand class >> withRandomCards: anAmountOfCards [
	self assertValidAmountOfCards: anAmountOfCards.
		^self new initializeWithRandomCards: anAmountOfCards.
]

{ #category : #'as yet unclassified' }
Hand >> addNewCard: aCard [ 
	cards add: aCard.
]

{ #category : #'as yet unclassified' }
Hand >> addNewRandomCard [
	cards add: (self pickNewRandomCard)
]

{ #category : #'as yet unclassified' }
Hand >> cards [
	^ cards
]

{ #category : #'as yet unclassified' }
Hand >> initializeWithRandomCards: amountOfCards [
	cards := OrderedCollection new.
	1 to: (amountOfCards) do: [:i | cards add: (self pickNewRandomCard) ].
]

{ #category : #'as yet unclassified' }
Hand >> pickNewRandomCard [
	^ ({ OverloadCard new . SpeedCard new . AccelerationCard new . CancellationCard new . RedoCard new . RepeatCard new } atRandom)
	
]

{ #category : #'as yet unclassified' }
Hand >> removeCardOf: aCardType [ 

	| cardToDelete |
	cardToDelete := (cards detect: [:card | (card type) = aCardType]).
	cards remove: cardToDelete.
	^cardToDelete


]
