"
I am a Player.
I can roll a dice and I have a name.
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : #'instance creation' }
Player >> initializeWithName: aName [
	name := aName.



	
]

{ #category : #accessing }
Player >> name [ 
	^name

]

{ #category : #'dice roll' }
Player >> rollDice: aDiceList [ 
^(aDiceList sum: [:dice | dice roll]). 

]
