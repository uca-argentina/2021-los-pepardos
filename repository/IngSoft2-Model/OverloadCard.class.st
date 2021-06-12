Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
OverloadCard >> applyCardEffectTo: aPlayerStatus on: anIngSoft2Game [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied)
]

{ #category : #'as yet unclassified' }
OverloadCard >> boostApplied [
	^-2
]

{ #category : #'as yet unclassified' }
OverloadCard >> type [
	type := 'Overload'.
	^type.
	
]
