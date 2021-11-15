!classDefinition: #XXX category: 'MarsRover - Exercise'!
TestCase subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover - Exercise'!

!XXX methodsFor: 'test' stamp: 'MW 11/14/2021 23:19:52'!
test01
	| aMarsRover |
	aMarsRover := MarsRover new initializeWith: #(0 0 'N').
	self assert: aMarsRover currentPosition equals: #(0 0 'N').! !

!XXX methodsFor: 'test' stamp: 'MW 11/14/2021 23:28:48'!
test02
	|aMarsRover|
	aMarsRover := MarsRover new initializeWith: #(0 0 'N').
	aMarsRover changePositionWith: 'f'.
	self assert: aMarsRover currentPosition equals: #(1 0 'N').! !


!classDefinition: #MarsRover category: 'MarsRover - Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover - Exercise'!

!MarsRover methodsFor: 'accessing' stamp: 'MW 11/14/2021 17:20:59'!
currentPosition
	^position.! !


!MarsRover methodsFor: 'mars rover management' stamp: 'MW 11/14/2021 23:28:06'!
changePositionWith: aCommand
	"|currentXCoord|
	currentXCoord := position at:1.
	(aCommand = 'f') ifTrue:[position at: 1 put: (currentXCoord +1)]."
	(aCommand = 'f') ifTrue:[position at: 1 put: 1]
	! !


!MarsRover methodsFor: 'initialization' stamp: 'MW 11/14/2021 23:20:40'!
initializeWith: aPosition
	position := aPosition.! !
