!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/12/2021 19:34:01'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook operationAddANewCustomer |
	
	customerBook := CustomerBook new.
		
	operationAddANewCustomer := [ customerBook addCustomerNamed: 'John Lennon' ].
	
	self validateOperationRunningTimeOf: operationAddANewCustomer withTime: 50.

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:31:48'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook customerName operationRemoveAnExistingCustomer |
	
	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationRemoveAnExistingCustomer := [ customerBook removeCustomerNamed: customerName ].
	
	self validateOperationRunningTimeOf: operationRemoveAnExistingCustomer withTime: 100.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 14:29:40'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook operationAddACustomerWithEmptyName xxxx |
	customerBook := CustomerBook new.
	
	operationAddACustomerWithEmptyName := [ customerBook addCustomerNamed: ''].
	
	xxxx := [self validateExpectedValuesTests3: customerBook withError: Error].
	
	self canNotPerformOperation: operationAddACustomerWithEmptyName in: customerBook failsWith: Error andValidates: xxxx.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 11:35:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook operationRemoveAnInvalidCustomer customerName xxxx |

	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	customerName := 'Paul McCartney'.
	
	operationRemoveAnInvalidCustomer := [ customerBook removeCustomerNamed: customerName].
	
	xxxx := [self validateExpectedValuesTests478: customerBook].
	
	self canNotPerformOperation: operationRemoveAnInvalidCustomer in: customerBook failsWith: NotFound andValidates: xxxx.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 10:53:14'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook customerName operationExtraWithACustomer |
	
	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationExtraWithACustomer := [].
	self validateNumberOfCustomersIn: customerBook withExpectedNumber: 1 applying: operationExtraWithACustomer  toCustomer: customerName.
	
	self assert: (customerBook includesCustomerNamed: customerName).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 10:54:02'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook customerName operationExtraWithACustomer |
	
	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationExtraWithACustomer := [ customerBook removeCustomerNamed: customerName ].
	
	self validateNumberOfCustomersIn: customerBook withExpectedNumber: 0 applying: operationExtraWithACustomer toCustomer: customerName .

	self deny: (customerBook includesCustomerNamed: customerName).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 11:49:25'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook operationSuspendAnInvalidCustomer customerName xxxx |

	customerName := 'Ringo Starr'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	
	operationSuspendAnInvalidCustomer := [ customerBook suspendCustomerNamed: customerName].
	
	xxxx := [self validateExpectedValuesTests478: customerBook].
	
	self canNotPerformOperation: operationSuspendAnInvalidCustomer in: customerBook failsWith: CantSuspend andValidates: xxxx.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/13/2021 12:13:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook operationSuspendAnAlreadySuspendedCustomer customerName xxxx|

	customerName := 'John Lennon'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationSuspendAnAlreadySuspendedCustomer := [ customerBook suspendCustomerNamed: customerName].
	customerBook suspendCustomerNamed: customerName.
	
	xxxx := [self validateExpectedValuesTests478: customerBook].
	
	self canNotPerformOperation: operationSuspendAnAlreadySuspendedCustomer in: customerBook failsWith: CantSuspend andValidates: xxxx.
! !


!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/12/2021 17:26:03'!
canNotPerformOperation: operationWithInvalidCustomer in: customerBook failsWith: errorType
	
	[ operationWithInvalidCustomer value.
	self fail]
		on: errorType
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/13/2021 11:48:26'!
canNotPerformOperation: operationWithInvalidCustomer in: customerBook failsWith: errorType andValidates: expectedValues 
	
	[ operationWithInvalidCustomer value.
	self fail]
		on: errorType
		do: [ :anError | expectedValues value].! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'TK 10/12/2021 19:40:51'!
validateAmountOfCustomersIn: customerBook withExpectedValue: expectedValue using: customerName and: operationExtraWithCustomer

	customerBook suspendCustomerNamed: customerName.

	operationExtraWithCustomer value.

	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: expectedValue equals: customerBook numberOfSuspendedCustomers.
	self assert: expectedValue equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/13/2021 14:30:34'!
validateExpectedValuesTests3: customerBook withError: anError

	self assert: (anError messageText) = (CustomerBook customerCanNotBeEmptyErrorMessage).
	self assert: customerBook isEmpty.! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/13/2021 14:40:38'!
validateExpectedValuesTests478: customerBook
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: 'John Lennon').
! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/13/2021 10:54:54'!
validateNumberOfCustomersIn: customerBook withExpectedNumber: value applying: operationExtraWithCustomer toCustomer: customerName

	customerBook suspendCustomerNamed: customerName.

	operationExtraWithCustomer value.

	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: value equals: customerBook numberOfSuspendedCustomers.
	self assert: value equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/12/2021 14:13:23'!
validateOperationRunningTimeOf: operationWithCustomer withTime: operationRunningTime
	
	| millisecondsAfterRunning millisecondsBeforeRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	operationWithCustomer value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (operationRunningTime * millisecond)! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'MW 10/12/2021 15:41:09'!
validateEmptyNameError
	! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'MW 10/12/2021 15:42:40'!
validateEmptyNameIn: customerBook with: anError
	self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty 
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'MW 10/12/2021 15:44:26'!
validateNumberOfCustomersIn: customerBook
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: 'John Lennon') ! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TK 10/12/2021 20:23:31'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'TK 10/12/2021 20:21:31'!
removeCustomerNamed: aName 
 
	(self removeCustomerNamedIfFound: aName inCollection: active) ifTrue: [ ^ aName ].
	(self removeCustomerNamedIfFound: aName inCollection: suspended) ifTrue: [ ^ aName ].
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'TK 10/12/2021 20:25:08'!
suspendCustomerNamed: aName 

	active remove: aName ifAbsent: [ ^ CantSuspend signal ].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'TK 10/13/2021 14:57:37'!
numberOfCustomers
	
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'customer management - private' stamp: 'TK 10/12/2021 20:21:31'!
removeCustomerNamedIfFound: aName inCollection: collection
 
	collection remove: aName ifAbsent: [ ^ false ].
	^ true! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'instance' stamp: 'MW 10/12/2021 17:01:58'!
instanceANewBookAndAddANewCustomerNamed: customerName
	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customerName.
	^customerBook! !
