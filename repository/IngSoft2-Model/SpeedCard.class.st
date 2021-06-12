Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> applyCardEffectTo: aPlayerStatus on: anIngSoft2Game [ 
	aPlayerStatus modifyActiveBoostBy: 1
]

{ #category : #'as yet unclassified' }
SpeedCard >> type [
	type := 'Speed'.
	^type.
]
