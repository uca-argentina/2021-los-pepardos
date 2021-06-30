"
A player has a hand which holds cards.
That hand should be able to:
- Pick a new card
- Remove a card from the hand

"
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

{ #category : #'card adding' }
Hand >> addNewCard: aCard [ 
	cards add: aCard.
]

{ #category : #'card adding' }
Hand >> addNewRandomCard [
	cards add: (self pickNewRandomCard)
]

{ #category : #accessing }
Hand >> cards [
	^ cards
]

{ #category : #initialization }
Hand >> initializeWithRandomCards: amountOfCards [
	cards := OrderedCollection new.
	1 to: (amountOfCards) do: [:i | cards add: (self pickNewRandomCard) ].
]

{ #category : #'card selection' }
Hand >> pickNewRandomCard [
	^ ({ OverloadCard new . SpeedCard new . AccelerationCard new . CancellationCard new . RedoCard new . RepeatCard new } atRandom)
	
]

{ #category : #'card removal' }
Hand >> remove: aCardType [ 

	| cardToDelete |
	cardToDelete := (cards detect: [:card | (card type) = aCardType]).
	cards remove: cardToDelete.
	^cardToDelete


]
