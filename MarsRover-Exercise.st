!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 08:54:31'!
test01AMarsRoverStartsAtTheInitialPosition

	| aMarsRover |
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	self assert: aMarsRover currentPosition equals: (0 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 08:58:29'!
test02AMarsRoverStartsAtTheInitialCardinalPoint

	| aMarsRover |
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	self assert: aMarsRover currentCardinalPoint equals: 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:20:34'!
test03WhenAMarsRoverMovesForwardFacingNorthItsYPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommand: 'f'.
	self assert: aMarsRover currentPosition equals: (0 @ 1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:20:51'!
test04WhenAMarsRoverMovesBackwardsFacingNorthItsYPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommand: 'b'.
	self assert: aMarsRover currentPosition equals: (0 @ -1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:21:01'!
test05WhenAMarsRoverMovesForwardFacingSouthItsYPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommand: 'f'.
	self assert: aMarsRover currentPosition equals: (0 @ -1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:21:08'!
test06WhenAMarsRoverMovesBackwardsFacingSouthItsYPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommand: 'b'.
	self assert: aMarsRover currentPosition equals: (0 @ 1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:23:28'!
test07WhenAMarsRoverMovesForwardFacingEastItsXPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommand: 'f'.
	self assert: aMarsRover currentPosition equals: (1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:25:18'!
test08WhenAMarsRoverMovesBackwardsFacingEastItsXPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommand: 'b'.
	self assert: aMarsRover currentPosition equals: (-1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:26:15'!
test09WhenAMarsRoverMovesForwardFacingWestItsXPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommand: 'f'.
	self assert: aMarsRover currentPosition equals: (-1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 09:31:37'!
test10WhenAMarsRoverMovesBackwardsFacingWestItsXPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommand: 'b'.
	self assert: aMarsRover currentPosition equals: (1 @ 0).! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'accessing' stamp: 'TK 11/15/2021 08:59:01'!
currentCardinalPoint
	
	^ cardinalPoint! !

!MarsRover methodsFor: 'accessing' stamp: 'MW 11/14/2021 17:20:59'!
currentPosition
	^position.! !


!MarsRover methodsFor: 'mars rover management' stamp: 'TK 11/15/2021 09:32:17'!
executeCommand: aCommand

	(aCommand = 'f') ifTrue: [ 
		(self currentCardinalPoint = 'N') ifTrue: [ position := (0 @ 1) ].
		(self currentCardinalPoint = 'S') ifTrue: [ position := (0 @ -1) ].
		(self currentCardinalPoint = 'E') ifTrue: [ position := (1 @ 0) ].
		(self currentCardinalPoint = 'W') ifTrue: [ position := (-1 @ 0) ].
	].
	(aCommand = 'b') ifTrue: [ 
		(self currentCardinalPoint = 'N') ifTrue: [ position := (0 @ -1) ].
		(self currentCardinalPoint = 'S') ifTrue: [ position := (0 @ 1) ].
		(self currentCardinalPoint = 'E') ifTrue: [ position := (-1 @ 0) ].
		(self currentCardinalPoint = 'W') ifTrue: [ position := (1 @ 0) ].
	].! !


!MarsRover methodsFor: 'initialization' stamp: 'TK 11/15/2021 08:50:19'!
initializeAtPosition: aPosition facing: aCardinalPoint

	position := aPosition.
	cardinalPoint := aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'TK 11/15/2021 08:49:34'!
atPosition: aPosition facing: aCardinalPoint

	^ MarsRover new initializeAtPosition: aPosition facing: aCardinalPoint! !
