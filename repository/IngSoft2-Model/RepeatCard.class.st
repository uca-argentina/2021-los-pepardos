"
I am a RepeatCard
"
Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
RepeatCard >> applyCardEffectTo: aPlayerStatus on: aGame playedBy: cardUser [
	(aGame lastEffectApplied) applyTo: aPlayerStatus withARollOf: 0 on: (aGame board) beingPlayedOn: aGame 
]
