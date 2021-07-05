"
I am an Overloard Card.
I know how to apply my own effect and the boost resulting when I am played.
"
Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
OverloadCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied).
	aPlayerStatus activeEffectsAdd: self.
	aGame updateLastCardPlayedToBe: self.
]

{ #category : #'boost application' }
OverloadCard >> boostApplied [
	^-2
]

{ #category : #testing }
OverloadCard >> isPermanent [
	^true
]

{ #category : #'as yet unclassified' }
OverloadCard >> removeBoostProvidedFrom: aPlayerStatus on: anIngSoft2Game [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied * -1)
]

{ #category : #accessing }
OverloadCard >> type [
	type := 'Overload'.
	^type.
	
]
