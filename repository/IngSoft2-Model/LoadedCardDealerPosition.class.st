Class {
	#name : #LoadedCardDealerPosition,
	#superclass : #Object,
	#instVars : [
		'loadedCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition class >> handing: aCardType [
	^ self new initializeWithReturningCard: aCardType
]

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition >> applyEffectTo: aPlayerStatus afterLandingOn: aLoadedCardDealerPosition withARollOf: anInteger onGame: anIngSoft2Game [ 
	aPlayerStatus hand addNewCard: loadedCard
]

{ #category : #'as yet unclassified' }
LoadedCardDealerPosition >> initializeWithReturningCard: aCardType [
	loadedCard := aCardType.
]
