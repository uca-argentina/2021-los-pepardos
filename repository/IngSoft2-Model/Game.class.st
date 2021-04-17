Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'player',
		'dice',
		'board',
		'winner',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
Game >> checkWinner [

		(player at:2 ) >= board positions
		ifTrue: [winner := (player at:1) name ]
		ifFalse: [winner := 'No gano nadie ']
	
	
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard [ 
	position := 0.
	player := OrderedCollection new.
	player add: aPlayer.
	player add: position.
	dice := aDice.
	board := aBoard.
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer positionInBoardBy: numberRolledOnDice [

	player at:2 put: (numberRolledOnDice + position).
]

{ #category : #'as yet unclassified' }
Game >> winner [
	^winner. 
]
