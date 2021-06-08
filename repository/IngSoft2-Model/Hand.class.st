Class {
	#name : #Hand,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Hand class >> withRandomCards: anAmountOfRandomCards [
	^self new initializeWithRandomCards: anAmountOfRandomCards.
]

{ #category : #'as yet unclassified' }
Hand >> addNewCard [
	cards add: (self pickNewCard)
]

{ #category : #'as yet unclassified' }
Hand >> cards [
	^ cards
]

{ #category : #'as yet unclassified' }
Hand >> initializeWithRandomCards: amountOfCards [
	cards := OrderedCollection new.
	1 to: (amountOfCards) do: [:i | cards add: (self pickNewCard) ].
]

{ #category : #'as yet unclassified' }
Hand >> pickNewCard [
	^ ({ OverloadCard new . SpeedCard new . AccelerationCard new . CancellationCard new . RedoCard new . RepeatCard new } atRandom)
	
]
