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


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:32:22'!
test01findWithOneElementMatchesPrefix

	| matchedElements |

	ooStack push: 'Winter is coming'.
	matchedElements := sentenceFinder find: 'Wint' in: ooStack.

	self assert: matchedElements first equals: 'Winter is coming'.
	self assert: matchedElements size equals: 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 16:45:02'!
test02findWithOneElementDoesNotMatchPrefix
	
	self assertNoMatchingElementIn: 'Is coming' with: 'Wint'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:31:52'!
test03findWithOneElementKeySensitiveDoesNotMatchPrefix

	self assertNoMatchingElementIn: 'winter is coming' with: 'Wint'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:31:56'!
test04findWithOneElementWithPrefixNotAtTheStart

	self assertNoMatchingElementIn: 'is coming Winter' with: 'Wint'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:32:03'!
test05findWithMultipleElementsMatchesPrefixInMoreThanOneElement
	
	| matchedElements |
	
	matchedElements := self pushThreeElements: #('Winter is here' 'Winter is coming' 'Is coming Winter') andFind: 'Wint'.

	self assert: matchedElements size equals: 2.
	self assert: matchedElements first equals: 'Winter is coming'.
	self assert: matchedElements second equals: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:32:11'!
test06findWithMultipleElementsDoesNotMatchAnyElement

	| matchedElements |
	
	matchedElements := self pushThreeElements: #('winter is here' 'winter is coming' 'Is coming Winter') andFind: 'Wint'.

	self assert: matchedElements isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:14:00'!
test07findWithMultipleElementsDoesNotChangeStack
	
	self pushThreeElements: #('Winter is here' 'Winter is coming' 'Is coming Winter') andFind: 'Wint'.
	
	self assert: ooStack pop equals: 'Is coming Winter'.
	self assert: ooStack pop equals: 'Winter is coming'.
	self assert: ooStack pop equals: 'Winter is here'.
	self assert: ooStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'TK 11/2/2021 15:12:05'!
test08findWithEmptyStackReturnsEmptyCollection

	self assert: (sentenceFinder find: 'Wint' in: ooStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:31:15'!
test09findWithEmptyPrefixSendsError

	self failsWithInvalidPrefix: ''! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MW 11/2/2021 17:31:20'!
test10findPrefixWithSpaceSendsError

	self failsWithInvalidPrefix: ' '! !


!SentenceFinderByPrefixTest methodsFor: 'test - private' stamp: 'MW 11/2/2021 16:44:09'!
assertNoMatchingElementIn: sentence with: prefix
	| matchedElements |

	ooStack push: sentence.
	matchedElements := sentenceFinder find: prefix in: ooStack.
	self assert: matchedElements isEmpty.	! !

!SentenceFinderByPrefixTest methodsFor: 'test - private' stamp: 'MW 11/2/2021 17:31:00'!
failsWithInvalidPrefix: prefix
	self
		should: [ sentenceFinder find: prefix in: ooStack ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix invalidPrefixErrorMessage ]! !

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

!OOStack methodsFor: 'stack management' stamp: 'MW 11/2/2021 10:48:52'!
isEmpty

	^ stackTop isEmpty! !

!OOStack methodsFor: 'stack management' stamp: 'MW 11/2/2021 10:48:52'!
pop
	| poppedElementValue |
	
	poppedElementValue := stackTop elementValue.
	stackTop := stackTop pop.
	stackSize := stackSize - 1.
	^ poppedElementValue.! !

!OOStack methodsFor: 'stack management' stamp: 'MW 11/2/2021 10:48:52'!
push: anElementValue
	| newStackElement |

	newStackElement := OOStackElement withElementValue: anElementValue andPreviousElement: stackTop.
	stackTop := newStackElement.
	stackSize := stackSize + 1.! !


!OOStack methodsFor: 'initialization' stamp: 'MW 11/2/2021 10:48:52'!
initialize

	stackTop := OOStackBase new.
	stackSize := 0! !


!OOStack methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:55:01'!
size

	^ stackSize! !

!OOStack methodsFor: 'accessing' stamp: 'MW 11/2/2021 10:48:52'!
top

	^ stackTop top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'TK 11/1/2021 21:24:10'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackComponent category: 'Stack-Exercise'!
Object subclass: #OOStackComponent
	instanceVariableNames: 'elementValue previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackComponent methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:21:15'!
isEmpty

	self subclassResponsibility ! !

!OOStackComponent methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:36:31'!
pop

	self subclassResponsibility ! !


!OOStackComponent methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:17:01'!
elementValue

	self subclassResponsibility ! !

!OOStackComponent methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:33:23'!
top

	self subclassResponsibility ! !


!classDefinition: #OOStackBase category: 'Stack-Exercise'!
OOStackComponent subclass: #OOStackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBase methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:20:15'!
isEmpty

	^ true! !

!OOStackBase methodsFor: 'stack management' stamp: 'MW 11/2/2021 10:37:54'!
pop

	^ self emptyStackDescriptionError ! !


!OOStackBase methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:17:46'!
elementValue

	^ self! !

!OOStackBase methodsFor: 'accessing' stamp: 'MW 11/2/2021 10:38:20'!
top

	^ self emptyStackDescriptionError ! !


!OOStackBase methodsFor: 'error descriptions' stamp: 'MW 11/2/2021 10:37:24'!
emptyStackDescriptionError

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

!OOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:19:21'!
top

	^ self elementValue ! !


!OOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:20:27'!
isEmpty

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

!SentenceFinderByPrefix methodsFor: 'error descriptions' stamp: 'TK 11/2/2021 12:15:06'!
invalidPrefixError

	^ self error: self class invalidPrefixErrorMessage! !


!SentenceFinderByPrefix methodsFor: 'sentence finder management' stamp: 'TK 11/2/2021 15:18:38'!
find: prefix in: stack

	| auxiliarStack matchedElements poppedElement |
	
	(self isValidPrefix: prefix) ifFalse: [ ^ self invalidPrefixError ].
	
	matchedElements := OrderedCollection new.
	auxiliarStack := OOStack new initialize.
	
	[ stack isEmpty ] whileFalse: [
		poppedElement := stack pop.
		auxiliarStack push: poppedElement.

		(poppedElement beginsWith: prefix) ifTrue: [ matchedElements add: poppedElement ].
	].

	[ auxiliarStack isEmpty ] whileFalse: [
		poppedElement := auxiliarStack pop.
		stack push: poppedElement.
	].
	
	^matchedElements.! !


!SentenceFinderByPrefix methodsFor: 'sentence finder management - private' stamp: 'MW 11/2/2021 16:25:14'!
emptyStack: sourceStack andFillStack: destinationStack doingOperation: anOperation
	|poppedElement |
	
	[ sourceStack isEmpty ] whileFalse: [
		poppedElement := sourceStack pop.
		destinationStack push: poppedElement.

		(#anOperation asMessageWith: poppedElement) value.
	].! !

!SentenceFinderByPrefix methodsFor: 'sentence finder management - private' stamp: 'TK 11/2/2021 14:58:28'!
isValidPrefix: aPrefix

	^ (aPrefix isEmpty not) and: (aPrefix includesSubString: ' ') not.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TK 11/2/2021 12:14:48'!
invalidPrefixErrorMessage

	^ 'Invalid prefix'! !
