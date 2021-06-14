Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'type',
		'cardPreviouslyPlayed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 

	|reversedCardHistory lastPermanentCardPlayed |
	reversedCardHistory := aPlayerStatus cardHistory reverse.
	cardPreviouslyPlayed := aPlayerStatus hand cards last.
	lastPermanentCardPlayed := reversedCardHistory detect: [ :card | card isPermanent ].
	aGame play: lastPermanentCardPlayed on: aPlayerStatus.
]

{ #category : #'as yet unclassified' }
RedoCard >> isPermanent [
	^false
]

{ #category : #'as yet unclassified' }
RedoCard >> type [
	type := 'Redo'.
	^type.
]
