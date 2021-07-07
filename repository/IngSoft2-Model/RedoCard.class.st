"
I am a RedoCard. 

"
Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
RedoCard >> applyCardEffectTo: aPlayerStatus on: aGame playedBy: cardUser [
	aGame applyRedoCardEffectOn: aPlayerStatus playedBy: cardUser.
]
