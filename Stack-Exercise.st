!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'MW 10/30/2021 14:43:51'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'TK 11/3/2021 19:27:17'!
test11StackShouldNotPushMoreThanItsCapacity

	| stack |
	
	stack := OOStack instanceWithCapacity: 3.
	
	stack push: 'Hola'.
	stack push: 'como'.
	stack push: 'estas'.
	
	self
		should: [ stack push: 'hoy'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = LimitedOOStack fullStackErrorDescription ].
	
	self assert: stack size equals: 3.
	self assert: stack pop equals: 'estas'.
	self assert: stack pop equals: 'como'.
	self assert: stack pop equals: 'Hola'.
	self assert: stack isEmpty.! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'ooStack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'TK 11/2/2021 15:06:33'!
setUp

	ooStack := OOStack new initialize.
	sentenceFinder := SentenceFinderByPrefix new.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:10:36'!
test01findWithOneElementStackedMatchesPrefix

	| matchedElements |

	ooStack push: 'Winter is coming'.
	matchedElements := sentenceFinder find: 'Wint' in: ooStack.

	self assert: matchedElements first equals: 'Winter is coming'.
	self assert: matchedElements size equals: 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:10:50'!
test02findWithOneElementStackedDoesNotMatchPrefix

	self assertPrefix: 'Wint' doesNotMatchSentence: 'Is coming'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:11:14'!
test03findWithOneElementKeySensitiveStackedDoesNotMatchPrefix

	self assertPrefix: 'Wint' doesNotMatchSentence: 'winter is coming'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:11:45'!
test04findWithOneElementStackedWithPrefixNotAtTheStart

	self assertPrefix: 'Wint' doesNotMatchSentence: 'is coming Winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:12:00'!
test05findWithMultipleElementsStackedMatchesPrefixInMoreThanOneElement
	
	| matchedElements |
	
	matchedElements := self pushThreeElements: #('Winter is here' 'Winter is coming' 'Is coming Winter') andFind: 'Wint'.

	self assert: matchedElements size equals: 2.
	self assert: matchedElements first equals: 'Winter is coming'.
	self assert: matchedElements second equals: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:12:07'!
test06findWithMultipleElementsStackedDoesNotMatchAnyElement

	| matchedElements |
	
	matchedElements := self pushThreeElements: #('winter is here' 'winter is coming' 'Is coming Winter') andFind: 'Wint'.

	self assert: matchedElements isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/3/2021 21:12:13'!
test07findWithMultipleElementsStackedDoesNotChangeStack
	
	self pushThreeElements: #('Winter is here' 'Winter is coming' 'Is coming Winter') andFind: 'Wint'.
	
	self assert: ooStack pop equals: 'Is coming Winter'.
	self assert: ooStack pop equals: 'Winter is coming'.
	self assert: ooStack pop equals: 'Winter is here'.
	self assert: ooStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'TK 11/2/2021 15:12:05'!
test08findWithEmptyStackReturnsEmptyCollection

	self assert: (sentenceFinder find: 'Wint' in: ooStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'TK 11/3/2021 09:40:10'!
test09findWithEmptyPrefixSendsError

	self assertFindFailsWithInvalidPrefix: ''! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'TK 11/3/2021 09:40:10'!
test10findPrefixWithSpaceSendsError

	self assertFindFailsWithInvalidPrefix: ' '! !


!SentenceFinderByPrefixTest methodsFor: 'test - private' stamp: 'TK 11/3/2021 19:34:54'!
assertFindFailsWithInvalidPrefix: prefix
	self
		should: [ sentenceFinder find: prefix in: ooStack ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test - private' stamp: 'TK 11/3/2021 09:46:02'!
assertPrefix: aPrefix doesNotMatchSentence: aSentence
	| matchedElements |

	ooStack push: aSentence.
	matchedElements := sentenceFinder find: aPrefix in: ooStack.
	self assert: matchedElements isEmpty.	! !

!SentenceFinderByPrefixTest methodsFor: 'test - private' stamp: 'MW 11/2/2021 17:03:56'!
pushThreeElements: elements andFind: prefix
	
	elements do: [ :element | ooStack push: element ].
	
	^sentenceFinder find: prefix in: ooStack.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackTop stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack management' stamp: 'MW 11/3/2021 15:11:28'!
isEmpty

	^ stackTop isStackBase! !

!OOStack methodsFor: 'stack management' stamp: 'MW 11/2/2021 10:48:52'!
pop
	| poppedElementValue |
	
	poppedElementValue := stackTop elementValue.
	stackTop := stackTop pop.
	stackSize := stackSize - 1.
	^ poppedElementValue.! !

!OOStack methodsFor: 'stack management' stamp: 'MW 11/3/2021 15:43:15'!
push: anElementValue
	| newStackElement |

	newStackElement := OOStackElement withElementValue: anElementValue andPreviousElement: stackTop.
	stackTop := newStackElement.
	stackSize := stackSize + 1.
	! !


!OOStack methodsFor: 'initialization' stamp: 'MW 11/2/2021 10:48:52'!
initialize

	stackTop := OOStackBase new.
	stackSize := 0! !


!OOStack methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:55:01'!
size

	^ stackSize! !

!OOStack methodsFor: 'accessing' stamp: 'MW 11/3/2021 15:13:28'!
top

	^ stackTop elementValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'TK 11/1/2021 21:24:10'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'TK 11/3/2021 19:23:50'!
instanceWithCapacity: capacity

	^ LimitedOOStack new initializeWithCapacity: capacity.! !


!classDefinition: #LimitedOOStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedOOStack
	instanceVariableNames: 'stackCapacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedOOStack methodsFor: 'stack management' stamp: 'TK 11/3/2021 19:30:38'!
push: anElementValue
	| newStackElement|

	(stackCapacity = stackSize) ifTrue:[^self fullStackError ].
	
	newStackElement := OOStackElement withElementValue: anElementValue andPreviousElement: stackTop.
	stackTop := newStackElement.
	stackSize := stackSize + 1.! !


!LimitedOOStack methodsFor: 'errors' stamp: 'TK 11/3/2021 19:30:38'!
fullStackError

	^self error: self class fullStackErrorDescription.! !


!LimitedOOStack methodsFor: 'initialization' stamp: 'TK 11/3/2021 19:24:13'!
initializeWithCapacity: capacity

	stackTop := OOStackBase new.
	stackSize := 0.
	stackCapacity := capacity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedOOStack class' category: 'Stack-Exercise'!
LimitedOOStack class
	instanceVariableNames: ''!

!LimitedOOStack class methodsFor: 'error descriptions' stamp: 'TK 11/3/2021 19:30:20'!
fullStackErrorDescription

	^'Stack is full'! !


!classDefinition: #OOStackComponent category: 'Stack-Exercise'!
Object subclass: #OOStackComponent
	instanceVariableNames: 'elementValue previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackComponent methodsFor: 'stack management' stamp: 'MW 11/3/2021 15:10:40'!
isStackBase

	self subclassResponsibility ! !

!OOStackComponent methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:36:31'!
pop

	self subclassResponsibility ! !


!OOStackComponent methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:17:01'!
elementValue

	self subclassResponsibility ! !


!classDefinition: #OOStackBase category: 'Stack-Exercise'!
OOStackComponent subclass: #OOStackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBase methodsFor: 'stack management' stamp: 'MW 11/3/2021 15:10:40'!
isStackBase

	^ true! !

!OOStackBase methodsFor: 'stack management' stamp: 'TK 11/3/2021 19:31:17'!
pop

	^ self emptyStackError ! !


!OOStackBase methodsFor: 'accessing' stamp: 'TK 11/3/2021 19:31:17'!
elementValue

	^ self emptyStackError ! !


!OOStackBase methodsFor: 'errors' stamp: 'TK 11/3/2021 19:31:17'!
emptyStackError

	^ self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackBase class' category: 'Stack-Exercise'!
OOStackBase class
	instanceVariableNames: ''!

!OOStackBase class methodsFor: 'error descriptions' stamp: 'TK 11/1/2021 20:57:31'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: 'Stack-Exercise'!
OOStackComponent subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:15:13'!
elementValue

	^ elementValue! !


!OOStackElement methodsFor: 'stack management' stamp: 'MW 11/3/2021 15:10:40'!
isStackBase

	^ false! !

!OOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:37:36'!
pop

	^ previous! !


!OOStackElement methodsFor: 'initialization' stamp: 'TK 11/1/2021 21:14:32'!
initializeWith: anElementValue andPreviousElement: previousElement

	previous := previousElement.
	elementValue := anElementValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackElement class' category: 'Stack-Exercise'!
OOStackElement class
	instanceVariableNames: ''!

!OOStackElement class methodsFor: 'instance creation' stamp: 'MW 11/2/2021 10:47:20'!
withElementValue: anElementValue andPreviousElement: aPreviousElement

	^ OOStackElement new initializeWith: anElementValue andPreviousElement: aPreviousElement! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'error descriptions' stamp: 'TK 11/3/2021 19:32:31'!
invalidPrefixError

	^ self error: self class invalidPrefixErrorDescription! !


!SentenceFinderByPrefix methodsFor: 'sentence finder management' stamp: 'TK 11/3/2021 11:23:52'!
find: prefix in: stack

	| auxiliarStack matchedElements |
	
	(self isValidPrefix: prefix) ifFalse: [ ^ self invalidPrefixError ].
	
	matchedElements := OrderedCollection new.
	auxiliarStack := OOStack new initialize.

	self emptyStack: stack andFillStack: auxiliarStack performingOperationWithElement: [ :poppedElement | 
		(poppedElement beginsWith: prefix) ifTrue: [ matchedElements add: poppedElement ].
	].

	self emptyStack: auxiliarStack andFillStack: stack performingOperationWithElement: [ :poppedElement | ].
	
	^matchedElements.! !


!SentenceFinderByPrefix methodsFor: 'sentence finder management - private' stamp: 'TK 11/3/2021 11:23:59'!
emptyStack: sourceStack andFillStack: destinationStack performingOperationWithElement: anOperation

	| poppedElement |

	[ sourceStack isEmpty ] whileFalse: [
		poppedElement := sourceStack pop.
		destinationStack push: poppedElement.

		anOperation value: poppedElement.
	]! !

!SentenceFinderByPrefix methodsFor: 'sentence finder management - private' stamp: 'TK 11/2/2021 14:58:28'!
isValidPrefix: aPrefix

	^ (aPrefix isEmpty not) and: (aPrefix includesSubString: ' ') not.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'TK 11/3/2021 19:32:31'!
invalidPrefixErrorDescription

	^ 'Invalid prefix'! !
