Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aPlayerStatus applyRedoCardEffectOn: aGame.
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
