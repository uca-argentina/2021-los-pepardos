"
I am a cancellation card.
I know how to apply the canellation effect.
"
Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
CancellationCard >> isPermanent [
	^false
]

{ #category : #accessing }
CancellationCard >> type [
	type := 'Cancellation'.
	^type
]
