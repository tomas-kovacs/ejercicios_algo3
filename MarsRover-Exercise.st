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

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test03WhenAMarsRoverMovesForwardFacingNorthItsYPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'f'.
	self assert: aMarsRover currentPosition equals: (0 @ 1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test04WhenAMarsRoverMovesBackwardsFacingNorthItsYPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'b'.
	self assert: aMarsRover currentPosition equals: (0 @ -1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test05WhenAMarsRoverMovesForwardFacingSouthItsYPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommandsSequence: 'f'.
	self assert: aMarsRover currentPosition equals: (0 @ -1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test06WhenAMarsRoverMovesBackwardsFacingSouthItsYPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommandsSequence: 'b'.
	self assert: aMarsRover currentPosition equals: (0 @ 1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test07WhenAMarsRoverMovesForwardFacingEastItsXPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommandsSequence: 'f'.
	self assert: aMarsRover currentPosition equals: (1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test08WhenAMarsRoverMovesBackwardsFacingEastItsXPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommandsSequence: 'b'.
	self assert: aMarsRover currentPosition equals: (-1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test09WhenAMarsRoverMovesForwardFacingWestItsXPositionGetsDecremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommandsSequence: 'f'.
	self assert: aMarsRover currentPosition equals: (-1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:20:46'!
test10WhenAMarsRoverMovesBackwardsFacingWestItsXPositionGetsIncremented

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommandsSequence: 'b'.
	self assert: aMarsRover currentPosition equals: (1 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:36:22'!
test11WhenAMarsRoverMovesForwardMultipleTimesFacingNorthItsYPositionGetsIncrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'fff'.
	self assert: aMarsRover currentPosition equals: (0 @ 3).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:37:06'!
test12WhenAMarsRoverMovesForwardMultipleTimesFacingSouthItsYPositionGetsDecrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommandsSequence: 'fff'.
	self assert: aMarsRover currentPosition equals: (0 @ -3).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:39:23'!
test13WhenAMarsRoverMovesForwardMultipleTimesFacingWestItsXPositionGetsDecrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommandsSequence: 'fff'.
	self assert: aMarsRover currentPosition equals: (-3 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:41:33'!
test14WhenAMarsRoverMovesForwardMultipleTimesFacingEastItsXPositionGetsIncrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommandsSequence: 'fff'.
	self assert: aMarsRover currentPosition equals: (3 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:43:06'!
test15WhenAMarsRoverMovesForwardMultipleTimesFacingWestItsXPositionGetsDecrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommandsSequence: 'fff'.
	self assert: aMarsRover currentPosition equals: (-3 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:43:44'!
test16WhenAMarsRoverMovesBackwardsMultipleTimesFacingWestItsXPositionGetsIncrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'W'.
	aMarsRover executeCommandsSequence: 'bbb'.
	self assert: aMarsRover currentPosition equals: (3 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:45:35'!
test17WhenAMarsRoverMovesBackwardsMultipleTimesFacingEastItsXPositionGetsDecrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'E'.
	aMarsRover executeCommandsSequence: 'bbb'.
	self assert: aMarsRover currentPosition equals: (-3 @ 0).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:47:51'!
test18WhenAMarsRoverMovesBackwardsMultipleTimesFacingNorthItsYPositionGetsDecrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'bbb'.
	self assert: aMarsRover currentPosition equals: (0 @ -3).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:48:19'!
test19WhenAMarsRoverMovesBackwardsMultipleTimesFacingSouthItsYPositionGetsIncrementedByTheNumberOfTimes

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'S'.
	aMarsRover executeCommandsSequence: 'bbb'.
	self assert: aMarsRover currentPosition equals: (0 @ 3).! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:57:19'!
test20WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsEastAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesEast

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'fffefff'.
	self assert: aMarsRover currentPosition equals: (3 @ 3).
	self assert: aMarsRover currentCardinalPoint equals: 'E'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 11:59:09'!
test21WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsWestAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesWest

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'fffwfff'.
	self assert: aMarsRover currentPosition equals: (-3 @ 3).
	self assert: aMarsRover currentCardinalPoint equals: 'W'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:16:05'!
test22WhenAMarsRoverTurnsEastTwiceItFacesTheCorrespondingCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'ee'.
	self assert: aMarsRover currentCardinalPoint equals: 'S'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:16:44'!
test23WhenAMarsRoverTurnsEastFourTimesItFacesTheInitialCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'eeee'.
	self assert: aMarsRover currentCardinalPoint equals: 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:16:56'!
test24WhenAMarsRoverTurnsEastTheeTimesItFacesTheCorrespondingCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'eee'.
	self assert: aMarsRover currentCardinalPoint equals: 'W'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:23:55'!
test25WhenAMarsRoverTurnsWestTwiceItFacesTheCorrespondingCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'ww'.
	self assert: aMarsRover currentCardinalPoint equals: 'S'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:23:47'!
test26WhenAMarsRoverTurnsWestThreeTimesItFacesTheCorrespondingCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'www'.
	self assert: aMarsRover currentCardinalPoint equals: 'E'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/15/2021 12:26:38'!
test27WhenAMarsRoverTurnsWestFourTimesItFacesTheInitialCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'.
	aMarsRover executeCommandsSequence: 'wwww'.
	self assert: aMarsRover currentCardinalPoint equals: 'N'.! !


!classDefinition: #CardinalPointOrientation category: 'MarsRover-Exercise'!
Object subclass: #CardinalPointOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!CardinalPointOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:09:33'!
value

	self subclassResponsibility! !


!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:20'!
determineMarsRoverCardinalPointTurningEast

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:48'!
determineMarsRoverCardinalPointTurningWest

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:03:28'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:04'!
determineMarsRoverPositionMovingForward: aMarsRover

	self subclassResponsibility! !


!classDefinition: #EastOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #EastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:20'!
determineMarsRoverCardinalPointTurningEast

	^ SouthOrientation new! !

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:26:24'!
determineMarsRoverCardinalPointTurningWest

	^ NorthOrientation new! !

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:03:48'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingEast! !

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:36'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingEast! !


!EastOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:09:48'!
value

	^ 'E'! !


!classDefinition: #NorthOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #NorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:20'!
determineMarsRoverCardinalPointTurningEast

	^ EastOrientation new! !

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:48'!
determineMarsRoverCardinalPointTurningWest

	^ WestOrientation new! !

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:05'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingNorth! !

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:54'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingNorth! !


!NorthOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:05'!
value

	^ 'N'! !


!classDefinition: #SouthOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #SouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:20'!
determineMarsRoverCardinalPointTurningEast

	^ WestOrientation new! !

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:24:40'!
determineMarsRoverCardinalPointTurningWest
	
	^ EastOrientation new! !

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:17'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingSouth! !

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:57:05'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingSouth! !


!SouthOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:25'!
value

	^ 'S'! !


!classDefinition: #WestOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #WestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:20'!
determineMarsRoverCardinalPointTurningEast

	^ NorthOrientation new! !

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 12:20:48'!
determineMarsRoverCardinalPointTurningWest

	^ SouthOrientation new! !

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:28'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingWest! !

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:57:15'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingWest! !


!WestOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:37'!
value

	^ 'W'! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:11:26'!
currentCardinalPoint
	
	^ cardinalPoint value! !

!MarsRover methodsFor: 'accessing' stamp: 'TK 11/15/2021 09:41:08'!
currentPosition

	^ position! !


!MarsRover methodsFor: 'mars rover management' stamp: 'TK 11/15/2021 12:20:58'!
executeCommand: aCommand

	(aCommand = $f) ifTrue: [ 		self moveForward ].
	(aCommand = $b) ifTrue: [ 		self moveBackwards ].
	(aCommand = $e) ifTrue: [ 		cardinalPoint := cardinalPoint determineMarsRoverCardinalPointTurningEast ].
	(aCommand = $w) ifTrue: [ 		cardinalPoint := cardinalPoint determineMarsRoverCardinalPointTurningWest ].
	"TODO: remove these ifs"! !

!MarsRover methodsFor: 'mars rover management' stamp: 'TK 11/15/2021 11:30:17'!
executeCommandsSequence: aCommandsSequence

	aCommandsSequence do: [ :command | self executeCommand: command ]! !


!MarsRover methodsFor: 'initialization' stamp: 'TK 11/15/2021 11:01:50'!
initializeAtPosition: aPosition facing: aCardinalPoint

	position := aPosition.
	(aCardinalPoint = 'N') ifTrue: [ cardinalPoint := NorthOrientation new ].
	(aCardinalPoint = 'S') ifTrue: [ cardinalPoint := SouthOrientation new ].
	(aCardinalPoint = 'E') ifTrue: [ cardinalPoint := EastOrientation new ].
	(aCardinalPoint = 'W') ifTrue: [ cardinalPoint := WestOrientation new ].
	"TODO: remove these ifs"! !


!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:12:27'!
moveBackwards

	cardinalPoint determineMarsRoverPositionMovingBackwards: self! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:46:03'!
moveBackwardsFacingEast

	position := position - (1 @ 0)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:47:33'!
moveBackwardsFacingNorth

	position := position - (0 @ 1)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:48:39'!
moveBackwardsFacingSouth

	position := position + (0 @ 1)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:45:04'!
moveBackwardsFacingWest
.
	position := position + (1 @ 0)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:12:20'!
moveForward

	cardinalPoint determineMarsRoverPositionMovingForward: self! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:40:52'!
moveForwardFacingEast

	position := position + (1 @ 0)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:18:37'!
moveForwardFacingNorth

	position := position + (0 @ 1)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:37:44'!
moveForwardFacingSouth

	position := position - (0 @ 1)! !

!MarsRover methodsFor: 'movement' stamp: 'TK 11/15/2021 11:41:05'!
moveForwardFacingWest

	position := position - (1 @ 0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'TK 11/15/2021 08:49:34'!
atPosition: aPosition facing: aCardinalPoint

	^ MarsRover new initializeAtPosition: aPosition facing: aCardinalPoint! !
