!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'test - private' stamp: 'TK 11/16/2021 15:56:14'!
marsRoverAtInitialPositionFacing: initialCardinalPoint executeCommands: aCommandsSequence andAssertFinalCardinalPoint: finalCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: initialCardinalPoint.
	aMarsRover executeCommandsSequence: aCommandsSequence.
	self assert: aMarsRover currentCardinalPoint equals: finalCardinalPoint.! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'TK 11/16/2021 15:25:08'!
marsRoverAtInitialPositionFacing: aCardinalPoint executeCommands: aCommandsSequence andAssertFinalPosition: finalPosition

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: aCardinalPoint.
	aMarsRover executeCommandsSequence: aCommandsSequence.
	self assert: aMarsRover currentPosition equals: finalPosition.! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'TK 11/16/2021 16:03:22'!
marsRoverAtInitialPositionFacing: initialCardinalPoint executeCommands: aCommandsSequence andAssertFinalPosition: finalPosition andFinalCardinalPoint: finalCardinalPoint

	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: initialCardinalPoint.
	aMarsRover executeCommandsSequence: aCommandsSequence.
	self assert: aMarsRover currentPosition equals: finalPosition.
	self assert: aMarsRover currentCardinalPoint equals: finalCardinalPoint.! !


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

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:26:07'!
test03WhenAMarsRoverMovesForwardFacingNorthItsYPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'f' andAssertFinalPosition: (0 @ 1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:42:44'!
test04WhenAMarsRoverMovesBackwardsFacingNorthItsYPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'b' andAssertFinalPosition: (0 @ -1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:43:19'!
test05WhenAMarsRoverMovesForwardFacingSouthItsYPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'S' executeCommands: 'f' andAssertFinalPosition: (0 @ -1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:44:15'!
test06WhenAMarsRoverMovesBackwardsFacingSouthItsYPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'S' executeCommands: 'b' andAssertFinalPosition: (0 @ 1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:44:51'!
test07WhenAMarsRoverMovesForwardFacingEastItsXPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'E' executeCommands: 'f' andAssertFinalPosition: (1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:45:26'!
test08WhenAMarsRoverMovesBackwardsFacingEastItsXPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'E' executeCommands: 'b' andAssertFinalPosition: (-1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:45:55'!
test09WhenAMarsRoverMovesForwardFacingWestItsXPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'W' executeCommands: 'f' andAssertFinalPosition: (-1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:47:01'!
test10WhenAMarsRoverMovesBackwardsFacingWestItsXPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'W' executeCommands: 'b' andAssertFinalPosition: (1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:47:30'!
test11WhenAMarsRoverMovesForwardMultipleTimesFacingNorthItsYPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'fff' andAssertFinalPosition: (0 @ 3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:48:07'!
test12WhenAMarsRoverMovesForwardMultipleTimesFacingSouthItsYPositionGetsDecrementedByTheNumberOfTimes
	
	self marsRoverAtInitialPositionFacing: 'S' executeCommands: 'fff' andAssertFinalPosition: (0 @ -3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:48:45'!
test13WhenAMarsRoverMovesForwardMultipleTimesFacingWestItsXPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'W' executeCommands: 'fff' andAssertFinalPosition: (-3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:49:15'!
test14WhenAMarsRoverMovesForwardMultipleTimesFacingEastItsXPositionGetsIncrementedByTheNumberOfTimes
	
	self marsRoverAtInitialPositionFacing: 'E' executeCommands: 'fff' andAssertFinalPosition: (3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:49:45'!
test15WhenAMarsRoverMovesForwardMultipleTimesFacingWestItsXPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'W' executeCommands: 'fff' andAssertFinalPosition: (-3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:51:39'!
test16WhenAMarsRoverMovesBackwardsMultipleTimesFacingWestItsXPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'W' executeCommands: 'bbb' andAssertFinalPosition: (3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:52:19'!
test17WhenAMarsRoverMovesBackwardsMultipleTimesFacingEastItsXPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'E' executeCommands: 'bbb' andAssertFinalPosition: (-3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:52:53'!
test18WhenAMarsRoverMovesBackwardsMultipleTimesFacingNorthItsYPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'bbb' andAssertFinalPosition: (0 @ -3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:53:17'!
test19WhenAMarsRoverMovesBackwardsMultipleTimesFacingSouthItsYPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'S' executeCommands: 'bbb' andAssertFinalPosition: (0 @ 3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:04:26'!
test20WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsEastAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesEast

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'fffefff' andAssertFinalPosition: (3 @ 3) andFinalCardinalPoint: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:05:20'!
test21WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsWestAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesWest

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'fffwfff' andAssertFinalPosition: (-3 @ 3) andFinalCardinalPoint: 'W'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 15:57:16'!
test22WhenAMarsRoverTurnsEastTwiceItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'ee' andAssertFinalCardinalPoint: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:00:18'!
test23WhenAMarsRoverTurnsEastFourTimesItFacesTheInitialCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'eeee' andAssertFinalCardinalPoint: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 14:53:25'!
test24WhenAMarsRoverTurnsEastThreeTimesItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'eee' andAssertFinalCardinalPoint: 'W'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:01:11'!
test25WhenAMarsRoverTurnsWestTwiceItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'ww' andAssertFinalCardinalPoint: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:01:51'!
test26WhenAMarsRoverTurnsWestThreeTimesItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'www' andAssertFinalCardinalPoint: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/16/2021 16:02:16'!
test27WhenAMarsRoverTurnsWestFourTimesItFacesTheInitialCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executeCommands: 'wwww' andAssertFinalCardinalPoint: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 16:30:44'!
test28WhenAMarsRoverReceivesAnInvalidCommandRaisesAnErrorAndEndsUpAtTheCorrespondingPositionAndCardinalPoint
	|aMarsRover|
	aMarsRover := MarsRover atPosition: (0@0) facing: 'N'. 
	
	self
		should: [ aMarsRover executeCommandsSequence: 'fefaff'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandErrorDescription ]	.
	self assert: aMarsRover currentPosition equals: (1@1).
	self assert: aMarsRover currentCardinalPoint equals: 'E'.
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 16:31:08'!
test29AMarsRoverCannotBeInstancedWithAndInvalidPosition

	self
		should: [MarsRover atPosition: 'position' facing: 'N'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidPositionErrorDescription ]	.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 16:31:53'!
test30AMarsRoverCannotBeInstancedWithAndInvalidCardinalPointType

	self
		should: [MarsRover atPosition: (0@0) facing: (0@0). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 16:32:41'!
test31AMarsRoverCannotBeInstancedWithAndInvalidCardinalPoint

	self
		should: [MarsRover atPosition: (0@0) facing: 'a'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	.
! !


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
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'accessing' stamp: 'TK 11/16/2021 16:29:24'!
currentCardinalPoint
	
	^ orientation value! !

!MarsRover methodsFor: 'accessing' stamp: 'TK 11/15/2021 09:41:08'!
currentPosition

	^ position! !


!MarsRover methodsFor: 'mars rover management' stamp: 'MW 11/17/2021 15:53:29'!
executeCommand: aCommand

	(aCommand = $f) ifTrue: [^self moveForward ].
	(aCommand = $b) ifTrue: [^self moveBackwards ].
	(aCommand = $e) ifTrue: [^	orientation := orientation determineMarsRoverCardinalPointTurningEast ].
	(aCommand = $w) ifTrue: [^	orientation := orientation determineMarsRoverCardinalPointTurningWest ].
	self error: self class invalidCommandErrorDescription.
	"TODO: remove these ifs"! !

!MarsRover methodsFor: 'mars rover management' stamp: 'TK 11/15/2021 11:30:17'!
executeCommandsSequence: aCommandsSequence

	aCommandsSequence do: [ :command | self executeCommand: command ]! !


!MarsRover methodsFor: 'initialization' stamp: 'TK 11/16/2021 16:29:24'!
initializeAtPosition: aPosition facing: aCardinalPoint

	position := aPosition.
	(aCardinalPoint = 'N') ifTrue: [ orientation := NorthOrientation new ].
	(aCardinalPoint = 'S') ifTrue: [ orientation := SouthOrientation new ].
	(aCardinalPoint = 'E') ifTrue: [ orientation := EastOrientation new ].
	(aCardinalPoint = 'W') ifTrue: [ orientation := WestOrientation new ].
	"TODO: remove these ifs"! !


!MarsRover methodsFor: 'movement' stamp: 'TK 11/16/2021 16:29:24'!
moveBackwards

	orientation determineMarsRoverPositionMovingBackwards: self! !

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

!MarsRover methodsFor: 'movement' stamp: 'TK 11/16/2021 16:29:24'!
moveForward

	orientation determineMarsRoverPositionMovingForward: self! !

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

!MarsRover class methodsFor: 'instance creation' stamp: 'MW 11/17/2021 16:27:23'!
atPosition: aPosition facing: aCardinalPoint
	
	(aPosition isKindOf: Point) ifFalse: [self error: self invalidPositionErrorDescription].
	(aCardinalPoint isKindOf: String) ifFalse: [self error: self invalidCardinalPointErrorDescription ].
	(#('N' 'S' 'E' 'W') includes: aCardinalPoint ) ifFalse:[self error: self invalidCardinalPointErrorDescription].
	^ MarsRover new initializeAtPosition: aPosition facing: aCardinalPoint! !


!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MW 11/17/2021 16:19:31'!
invalidCardinalPointErrorDescription
	^'invalid cardinal point'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MW 11/17/2021 15:50:02'!
invalidCommandErrorDescription
	^'invalid command'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MW 11/17/2021 16:08:48'!
invalidPositionErrorDescription
	^'invalid position'! !
