"
I am a NukePosition.
I know how to apply the Nuke effect
"
Class {
	#name : #NukePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'board effect' }
NukePosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: aGame [ 
	aBoard applyNukeEffectOn: aGame.
]
