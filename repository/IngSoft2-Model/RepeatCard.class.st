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
RepeatCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aGame play: (aGame lastCardPlayed) on: aPlayerStatus.
]

{ #category : #testing }
RepeatCard >> isPermanent [
	^false
]

{ #category : #accessing }
RepeatCard >> type [
	type := 'Repeat'.
	^type.
]
