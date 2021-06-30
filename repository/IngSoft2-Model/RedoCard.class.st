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
RedoCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aPlayerStatus applyRedoCardEffectOn: aGame.
]

{ #category : #testing }
RedoCard >> isPermanent [
	^false
]

{ #category : #accessing }
RedoCard >> type [
	type := 'Redo'.
	^type.
]
