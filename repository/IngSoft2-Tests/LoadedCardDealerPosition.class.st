"
LoadedCardDealerPosition used just for the tests to hand out a specific card.
"
Class {
	#name : #LoadedCardDealerPosition,
	#superclass : #Object,
	#instVars : [
		'loadedCard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition class >> handing: aCardType [
	^ self new initializeWithReturningCard: aCardType
]

{ #category : #'board effect' }
LoadedCardDealerPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aPlayerStatus hand addNewCard: loadedCard.
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'board effect' }
LoadedCardDealerPosition >> changeInPosition [
	^0
]

{ #category : #initialization }
LoadedCardDealerPosition >> initializeWithReturningCard: aCardType [
	loadedCard := aCardType.
]
