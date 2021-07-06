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

{ #category : #'boost application' }
CancellationCard >> applyCardEffectTo: aTarget on: aGame [ 
	aGame applyCancellationEffectOn: aTarget.
	aGame updateLastCardPlayedToBe: self.
]
