Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> isPermanent [
	^false
]

{ #category : #'as yet unclassified' }
RepeatCard >> type [
	type := 'Repeat'.
	^type.
]
