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

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aPlayerStatus hand addNewCard: loadedCard.
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition >> changeInPosition [
	^0
]

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition >> initializeWithReturningCard: aCardType [
	loadedCard := aCardType.
]
