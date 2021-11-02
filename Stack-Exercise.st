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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topOOStackElement stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:35:45'!
isEmpty

	^ topOOStackElement isEmpty! !

!OOStack methodsFor: 'stack management' stamp: 'TK 11/1/2021 21:14:43'!
pop
	| poppedElementValue |
	
	poppedElementValue := topOOStackElement elementValue.
	topOOStackElement := topOOStackElement pop.
	stackSize := stackSize - 1.
	^ poppedElementValue.! !

!OOStack methodsFor: 'stack management' stamp: 'TK 11/1/2021 21:22:42'!
push: anElementValue
	| newStackElement |

	newStackElement := NonBaseOOStackElement withElementValue: anElementValue andPreviousElement: topOOStackElement.
	topOOStackElement := newStackElement.
	stackSize := stackSize + 1.! !


!OOStack methodsFor: 'initialization' stamp: 'TK 11/1/2021 20:41:55'!
initialize

	topOOStackElement := BaseOOStackElement new.
	stackSize := 0! !


!OOStack methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:55:01'!
size

	^ stackSize! !

!OOStack methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:35:45'!
top

	^ topOOStackElement top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'TK 11/1/2021 21:24:10'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: 'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: 'elementValue previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:21:15'!
isEmpty

	self subclassResponsibility ! !

!OOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:36:31'!
pop

	self subclassResponsibility ! !


!OOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:17:01'!
elementValue

	self subclassResponsibility ! !

!OOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 20:33:23'!
top

	self subclassResponsibility ! !


!classDefinition: #BaseOOStackElement category: 'Stack-Exercise'!
OOStackElement subclass: #BaseOOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseOOStackElement methodsFor: 'as yet unclassified' stamp: 'TK 11/1/2021 21:17:46'!
elementValue

	^ self! !

!BaseOOStackElement methodsFor: 'as yet unclassified' stamp: 'TK 11/1/2021 20:20:15'!
isEmpty

	^ true! !

!BaseOOStackElement methodsFor: 'as yet unclassified' stamp: 'TK 11/1/2021 20:36:37'!
pop

	^ self error: self class stackEmptyErrorDescription! !

!BaseOOStackElement methodsFor: 'as yet unclassified' stamp: 'TK 11/1/2021 20:34:07'!
top

	^ self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BaseOOStackElement class' category: 'Stack-Exercise'!
BaseOOStackElement class
	instanceVariableNames: ''!

!BaseOOStackElement class methodsFor: 'error descriptions' stamp: 'TK 11/1/2021 20:57:31'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #NonBaseOOStackElement category: 'Stack-Exercise'!
OOStackElement subclass: #NonBaseOOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonBaseOOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:15:13'!
elementValue

	^ elementValue! !

!NonBaseOOStackElement methodsFor: 'accessing' stamp: 'TK 11/1/2021 21:19:21'!
top

	^ self elementValue ! !


!NonBaseOOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:20:27'!
isEmpty

	^ false! !

!NonBaseOOStackElement methodsFor: 'stack management' stamp: 'TK 11/1/2021 20:37:36'!
pop

	^ previous! !


!NonBaseOOStackElement methodsFor: 'initialization' stamp: 'TK 11/1/2021 21:14:32'!
initializeWith: anElementValue andPreviousElement: previousElement

	previous := previousElement.
	elementValue := anElementValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonBaseOOStackElement class' category: 'Stack-Exercise'!
NonBaseOOStackElement class
	instanceVariableNames: ''!

!NonBaseOOStackElement class methodsFor: 'instance creation' stamp: 'TK 11/1/2021 21:22:42'!
withElementValue: anElementValue andPreviousElement: aPreviousElement

	^ NonBaseOOStackElement new initializeWith: anElementValue andPreviousElement: aPreviousElement! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
