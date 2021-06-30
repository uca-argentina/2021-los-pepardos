"
I am a CardDealerPosition.
I know I need to make a player draw a card
"
Class {
	#name : #CardDealerPosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'board effect' }
CardDealerPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: aGame [ 
	aPlayerStatus hand addNewRandomCard.
	aBoard applyBasicEffectTo: aPlayerStatus withARollOf: anInteger. 
]

{ #category : #'board effect' }
CardDealerPosition >> changeInPosition [
	^0
]
