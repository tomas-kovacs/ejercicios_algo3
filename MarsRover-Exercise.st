!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'test - private' stamp: 'TK 11/18/2021 09:43:36'!
executeOperation: anOperation expecting: anErrorAssertion
	
	[ anOperation value.
	self fail ]
		on: Error
		do: [ :anError | (#errorAssertion asMessageWith: anError) value ].! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'MW 11/17/2021 20:18:55'!
marsRoverAtInitialPositionFacing: initialCardinalPoint executesCommands: aCommandsSequence andAssertsFinalCardinalPoint: finalCardinalPoint

	|aMarsRover|
	aMarsRover := self marsRoverFacingAtCardinalPoint: initialCardinalPoint executesCommands: aCommandsSequence.
	self assert: aMarsRover currentCardinalPoint equals: finalCardinalPoint.! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'MW 11/17/2021 20:18:55'!
marsRoverAtInitialPositionFacing: aCardinalPoint executesCommands: aCommandsSequence andAssertsFinalPosition: finalPosition

	|aMarsRover|
	aMarsRover := self marsRoverFacingAtCardinalPoint: aCardinalPoint executesCommands: aCommandsSequence.
	self assert: aMarsRover currentPosition equals: finalPosition.! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'MW 11/17/2021 20:18:55'!
marsRoverAtInitialPositionFacing: initialCardinalPoint executesCommands: aCommandsSequence andAssertsFinalPosition: finalPosition andFinalCardinalPoint: finalCardinalPoint

	|aMarsRover|
	aMarsRover := self marsRoverFacingAtCardinalPoint: initialCardinalPoint executesCommands: aCommandsSequence.
	self assert: aMarsRover currentPosition equals: finalPosition.
	self assert: aMarsRover currentCardinalPoint equals: finalCardinalPoint.! !

!MarsRoverTest methodsFor: 'test - private' stamp: 'MW 11/17/2021 20:18:55'!
marsRoverFacingAtCardinalPoint: aCardinalPoint executesCommands: aCommandsSequence
	| aMarsRover |
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: aCardinalPoint.
	aMarsRover executeCommandsSequence: aCommandsSequence.
	^aMarsRover.! !


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

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test03WhenAMarsRoverMovesForwardFacingNorthItsYPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'f' andAssertsFinalPosition: (0 @ 1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test04WhenAMarsRoverMovesBackwardsFacingNorthItsYPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'b' andAssertsFinalPosition: (0 @ -1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test05WhenAMarsRoverMovesForwardFacingSouthItsYPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'S' executesCommands: 'f' andAssertsFinalPosition: (0 @ -1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test06WhenAMarsRoverMovesBackwardsFacingSouthItsYPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'S' executesCommands: 'b' andAssertsFinalPosition: (0 @ 1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test07WhenAMarsRoverMovesForwardFacingEastItsXPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'E' executesCommands: 'f' andAssertsFinalPosition: (1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test08WhenAMarsRoverMovesBackwardsFacingEastItsXPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'E' executesCommands: 'b' andAssertsFinalPosition: (-1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test09WhenAMarsRoverMovesForwardFacingWestItsXPositionGetsDecremented

	self marsRoverAtInitialPositionFacing: 'W' executesCommands: 'f' andAssertsFinalPosition: (-1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test10WhenAMarsRoverMovesBackwardsFacingWestItsXPositionGetsIncremented

	self marsRoverAtInitialPositionFacing: 'W' executesCommands: 'b' andAssertsFinalPosition: (1 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test11WhenAMarsRoverMovesForwardMultipleTimesFacingNorthItsYPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'fff' andAssertsFinalPosition: (0 @ 3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test12WhenAMarsRoverMovesForwardMultipleTimesFacingSouthItsYPositionGetsDecrementedByTheNumberOfTimes
	
	self marsRoverAtInitialPositionFacing: 'S' executesCommands: 'fff' andAssertsFinalPosition: (0 @ -3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test13WhenAMarsRoverMovesForwardMultipleTimesFacingWestItsXPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'W' executesCommands: 'fff' andAssertsFinalPosition: (-3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test14WhenAMarsRoverMovesForwardMultipleTimesFacingEastItsXPositionGetsIncrementedByTheNumberOfTimes
	
	self marsRoverAtInitialPositionFacing: 'E' executesCommands: 'fff' andAssertsFinalPosition: (3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test15WhenAMarsRoverMovesBackwardsMultipleTimesFacingWestItsXPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'W' executesCommands: 'bbb' andAssertsFinalPosition: (3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test16WhenAMarsRoverMovesBackwardsMultipleTimesFacingEastItsXPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'E' executesCommands: 'bbb' andAssertsFinalPosition: (-3 @ 0)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test17WhenAMarsRoverMovesBackwardsMultipleTimesFacingNorthItsYPositionGetsDecrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'bbb' andAssertsFinalPosition: (0 @ -3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:33'!
test18WhenAMarsRoverMovesBackwardsMultipleTimesFacingSouthItsYPositionGetsIncrementedByTheNumberOfTimes

	self marsRoverAtInitialPositionFacing: 'S' executesCommands: 'bbb' andAssertsFinalPosition: (0 @ 3)! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:45'!
test19WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsRightAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesEast

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'fffrfff' andAssertsFinalPosition: (3 @ 3) andFinalCardinalPoint: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:45'!
test20WhenAMarsRoverFacingNorthMovesMultipleTimesTurnsLeftAndMovesAgainMultipleTimesItsXYPositionGetsUpdatedAndFacesWest

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'ffflfff' andAssertsFinalPosition: (-3 @ 3) andFinalCardinalPoint: 'W'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test21WhenAMarsRoverTurnsRightTwiceItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'rr' andAssertsFinalCardinalPoint: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test22WhenAMarsRoverTurnsRightFourTimesItFacesTheInitialCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'rrrr' andAssertsFinalCardinalPoint: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test23WhenAMarsRoverTurnsRightThreeTimesItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'rrr' andAssertsFinalCardinalPoint: 'W'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test24WhenAMarsRoverTurnsLeftTwiceItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'll' andAssertsFinalCardinalPoint: 'S'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test25WhenAMarsRoverTurnsLeftThreeTimesItFacesTheCorrespondingCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'lll' andAssertsFinalCardinalPoint: 'E'! !

!MarsRoverTest methodsFor: 'test' stamp: 'MW 11/17/2021 20:18:20'!
test26WhenAMarsRoverTurnsLeftFourTimesItFacesTheInitialCardinalPoint

	self marsRoverAtInitialPositionFacing: 'N' executesCommands: 'llll' andAssertsFinalCardinalPoint: 'N'! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/18/2021 09:45:15'!
test27WhenAMarsRoverReceivesAnInvalidCommandRaisesAnErrorAndEndsUpAtTheCorrespondingPositionAndCardinalPoint

	| aMarsRover anOperation anErrorAssertion |
	
	aMarsRover := MarsRover atPosition: (0 @ 0) facing: 'N'. 
	
	anOperation := [ aMarsRover executeCommandsSequence: 'frfaff' ].
	anErrorAssertion := [ :anError | self assert: anError messageText = MarsRover invalidCommandErrorDescription ]	.
		
	self executeOperation: anOperation expecting: anErrorAssertion.
	
	"self
		should: [ aMarsRover executeCommandsSequence: 'frfaff'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandErrorDescription ]	."
	self assert: aMarsRover currentPosition equals: (1 @ 1).
	self assert: aMarsRover currentCardinalPoint equals: 'E'.
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/18/2021 09:47:01'!
test28AMarsRoverCannotBeInstancedWithAndInvalidPosition

	| anOperation anErrorAssertion |

	anOperation := [ MarsRover atPosition: 'position' facing: 'N' ].
	anErrorAssertion := [ :anError | self assert: anError messageText = MarsRover invalidPositionErrorDescription ]	.
		
	self executeOperation: anOperation expecting: anErrorAssertion.

	"self
		should: [MarsRover atPosition: 'position' facing: 'N'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidPositionErrorDescription ]	."
! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/18/2021 09:46:17'!
test29AMarsRoverCannotBeInstancedWithAndInvalidCardinalPointType

	| anOperation anErrorAssertion |

	anOperation := [ MarsRover atPosition: (0 @ 0) facing: (0 @ 0) ].
	anErrorAssertion := [ :anError | self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	.
	self executeOperation: anOperation expecting: anErrorAssertion.

	"self
		should: [MarsRover atPosition: (0@0) facing: (0@0). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	."
! !

!MarsRoverTest methodsFor: 'test' stamp: 'TK 11/18/2021 09:46:49'!
test30AMarsRoverCannotBeInstancedWithAndInvalidCardinalPointValue

	| anOperation anErrorAssertion |

	anOperation := [ MarsRover atPosition: (0 @ 0) facing: 'a' ].
	anErrorAssertion := [ :anError | self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	.
	self executeOperation: anOperation expecting: anErrorAssertion.

	"self
		should: [MarsRover atPosition: (0@0) facing: 'a'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCardinalPointErrorDescription ]	."
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


!CardinalPointOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:02:07'!
determineMarsRoverCardinalPointTurningLeft

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:01:57'!
determineMarsRoverCardinalPointTurningRight

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:03:28'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	self subclassResponsibility! !

!CardinalPointOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:04'!
determineMarsRoverPositionMovingForward: aMarsRover

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPointOrientation class' category: 'MarsRover-Exercise'!
CardinalPointOrientation class
	instanceVariableNames: ''!

!CardinalPointOrientation class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:50:53'!
canInstantiateWith: aCardinalPoint

	self subclassResponsibility! !


!classDefinition: #EastOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #EastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!EastOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:02:07'!
determineMarsRoverCardinalPointTurningLeft

	^ NorthOrientation new! !

!EastOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:01:57'!
determineMarsRoverCardinalPointTurningRight

	^ SouthOrientation new! !

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:03:48'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingEast! !

!EastOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:36'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingEast! !


!EastOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:09:48'!
value

	^ 'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastOrientation class' category: 'MarsRover-Exercise'!
EastOrientation class
	instanceVariableNames: ''!

!EastOrientation class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:51:04'!
canInstantiateWith: aCardinalPoint

	^ aCardinalPoint = 'E'! !


!classDefinition: #NorthOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #NorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!NorthOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:02:07'!
determineMarsRoverCardinalPointTurningLeft

	^ WestOrientation new! !

!NorthOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:01:57'!
determineMarsRoverCardinalPointTurningRight

	^ EastOrientation new! !

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:05'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingNorth! !

!NorthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:56:54'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingNorth! !


!NorthOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:05'!
value

	^ 'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthOrientation class' category: 'MarsRover-Exercise'!
NorthOrientation class
	instanceVariableNames: ''!

!NorthOrientation class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:51:13'!
canInstantiateWith: aCardinalPoint

	^ aCardinalPoint = 'N'! !


!classDefinition: #SouthOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #SouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!SouthOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:02:07'!
determineMarsRoverCardinalPointTurningLeft
	
	^ EastOrientation new! !

!SouthOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:01:57'!
determineMarsRoverCardinalPointTurningRight

	^ WestOrientation new! !

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:17'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingSouth! !

!SouthOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:57:05'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingSouth! !


!SouthOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:25'!
value

	^ 'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthOrientation class' category: 'MarsRover-Exercise'!
SouthOrientation class
	instanceVariableNames: ''!

!SouthOrientation class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:51:22'!
canInstantiateWith: aCardinalPoint

	^ aCardinalPoint = 'S'! !


!classDefinition: #WestOrientation category: 'MarsRover-Exercise'!
CardinalPointOrientation subclass: #WestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!WestOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:02:07'!
determineMarsRoverCardinalPointTurningLeft

	^ SouthOrientation new! !

!WestOrientation methodsFor: 'movement' stamp: 'MW 11/17/2021 18:01:57'!
determineMarsRoverCardinalPointTurningRight

	^ NorthOrientation new! !

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 11:04:28'!
determineMarsRoverPositionMovingBackwards: aMarsRover

	aMarsRover moveBackwardsFacingWest! !

!WestOrientation methodsFor: 'movement' stamp: 'TK 11/15/2021 10:57:15'!
determineMarsRoverPositionMovingForward: aMarsRover

	aMarsRover moveForwardFacingWest! !


!WestOrientation methodsFor: 'accessing' stamp: 'TK 11/15/2021 11:10:37'!
value

	^ 'W'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestOrientation class' category: 'MarsRover-Exercise'!
WestOrientation class
	instanceVariableNames: ''!

!WestOrientation class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:51:30'!
canInstantiateWith: aCardinalPoint

	^ aCardinalPoint = 'W'! !


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


!MarsRover methodsFor: 'mars rover management' stamp: 'MW 11/18/2021 11:03:45'!
executeCommand: aCommand

	| theSelectedSubclass aCommandToExecute |
	
	theSelectedSubclass := self selectTheCommandSubclassThatCanInstantiateWith: aCommand.
	aCommandToExecute := theSelectedSubclass new.
	
	aCommandToExecute beExecutedBy: self.! !

!MarsRover methodsFor: 'mars rover management' stamp: 'TK 11/15/2021 11:30:17'!
executeCommandsSequence: aCommandsSequence

	aCommandsSequence do: [ :command | self executeCommand: command ]! !


!MarsRover methodsFor: 'initialization' stamp: 'TK 11/18/2021 09:48:33'!
initializeAtPosition: aPosition facing: aCardinalPoint

	| anOrientation |
	
	position := aPosition.

	anOrientation := self selectTheOrientationSubclassThatCanInstantiateWith: aCardinalPoint.
	orientation := anOrientation new.! !


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

!MarsRover methodsFor: 'movement' stamp: 'MW 11/18/2021 11:04:13'!
turnLeft

	orientation := orientation determineMarsRoverCardinalPointTurningLeft! !

!MarsRover methodsFor: 'movement' stamp: 'MW 11/18/2021 11:04:17'!
turnRight

	orientation := orientation determineMarsRoverCardinalPointTurningRight! !


!MarsRover methodsFor: 'private' stamp: 'MW 11/17/2021 18:26:44'!
selectTheOrientationSubclassThatCanInstantiateWith: aCardinalPoint

	^ CardinalPointOrientation subclasses detect: [ :subclass | (subclass canInstantiateWith: aCardinalPoint) ]! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 10:15:38'!
selectTheCommandSubclassThatCanInstantiateWith: aCommand

	^ MarsRoverCommand subclasses detect: [ :subclass | (subclass canInstantiateWith: aCommand) ]
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'TK 11/18/2021 09:50:04'!
atPosition: aPosition facing: aCardinalPoint
	
	(aPosition isKindOf: Point) ifFalse: [self error: self invalidPositionErrorDescription].
	(#('N' 'S' 'E' 'W') includes: aCardinalPoint ) ifFalse:[self error: self invalidCardinalPointErrorDescription].
	^ MarsRover new initializeAtPosition: aPosition facing: aCardinalPoint! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'TK 11/18/2021 09:50:24'!
invalidCardinalPointErrorDescription

	^ 'invalid cardinal point'! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'TK 11/18/2021 09:50:32'!
invalidCommandErrorDescription

	^ 'invalid command'! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'TK 11/18/2021 09:50:39'!
invalidPositionErrorDescription

	^ 'invalid position'! !


!classDefinition: #MarsRoverCommand category: 'MarsRover-Exercise'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverCommand methodsFor: 'execution' stamp: 'TK 11/18/2021 09:59:09'!
beExecutedBy: aMarsRover

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRover-Exercise'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 10:19:57'!
canInstantiateWith: aCommand
	self subclassResponsibility ! !


!classDefinition: #BackwardsCommand category: 'MarsRover-Exercise'!
MarsRoverCommand subclass: #BackwardsCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!BackwardsCommand methodsFor: 'execution' stamp: 'MW 11/18/2021 10:28:56'!
beExecutedBy: aMarsRover

	^aMarsRover moveBackwards! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsCommand class' category: 'MarsRover-Exercise'!
BackwardsCommand class
	instanceVariableNames: ''!

!BackwardsCommand class methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 11:00:26'!
canInstantiateWith: aCommand
	^ aCommand = $b! !


!classDefinition: #ForwardCommand category: 'MarsRover-Exercise'!
MarsRoverCommand subclass: #ForwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!ForwardCommand methodsFor: 'execution' stamp: 'MW 11/18/2021 10:29:00'!
beExecutedBy: aMarsRover

	^ aMarsRover moveForward! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommand class' category: 'MarsRover-Exercise'!
ForwardCommand class
	instanceVariableNames: ''!

!ForwardCommand class methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 11:00:09'!
canInstantiateWith: aCommand
	^ aCommand = $f! !


!classDefinition: #LeftCommand category: 'MarsRover-Exercise'!
MarsRoverCommand subclass: #LeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!LeftCommand methodsFor: 'execution' stamp: 'MW 11/18/2021 10:29:05'!
beExecutedBy: aMarsRover

	^ aMarsRover turnLeft! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftCommand class' category: 'MarsRover-Exercise'!
LeftCommand class
	instanceVariableNames: ''!

!LeftCommand class methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 11:00:35'!
canInstantiateWith: aCommand
	^ aCommand = $l! !


!classDefinition: #RightCommand category: 'MarsRover-Exercise'!
MarsRoverCommand subclass: #RightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!RightCommand methodsFor: 'execution' stamp: 'MW 11/18/2021 10:29:09'!
beExecutedBy: aMarsRover

	^ aMarsRover turnRight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightCommand class' category: 'MarsRover-Exercise'!
RightCommand class
	instanceVariableNames: ''!

!RightCommand class methodsFor: 'as yet unclassified' stamp: 'MW 11/18/2021 11:00:43'!
canInstantiateWith: aCommand
	^ aCommand = $r! !
