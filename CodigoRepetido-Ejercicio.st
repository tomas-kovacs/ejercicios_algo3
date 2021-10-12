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

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 14:55:36'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook operationAddANewCustomer |
	
	customerBook := CustomerBook new.
	"customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'."
		
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

!CustomerBookTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:26:29'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook operationRemoveAnInvalidCustomer customerName |

	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	
	operationRemoveAnInvalidCustomer := [ customerBook removeCustomerNamed: customerName].
	
	self canNotPerformOperation: operationRemoveAnInvalidCustomer in: customerBook failsWith: NotFound.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:33:44'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook customerName operationExtraWithACustomer |
	
	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationExtraWithACustomer := [].
	self validateAmountOfCustomersIn: customerBook withExpectedValue: 1 using: customerName and: operationExtraWithACustomer .
	
	self assert: (customerBook includesCustomerNamed: customerName).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:33:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook customerName operationExtraWithACustomer |
	
	customerName := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationExtraWithACustomer := [ customerBook removeCustomerNamed: customerName ].
	
	self validateAmountOfCustomersIn: customerBook withExpectedValue: 0 using: customerName and: operationExtraWithACustomer.

	self deny: (customerBook includesCustomerNamed: customerName).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:34:02'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook operationSuspendAnInvalidCustomer customerName |

	customerName := 'Ringo Starr'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	
	operationSuspendAnInvalidCustomer := [ customerBook suspendCustomerNamed: customerName].
	
	self canNotPerformOperation: operationSuspendAnInvalidCustomer in: customerBook failsWith: CantSuspend.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MW 10/12/2021 17:34:08'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook operationSuspendAnAlreadySuspendedCustomer customerName |

	customerName := 'John Lennon'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: customerName.
	
	operationSuspendAnAlreadySuspendedCustomer := [ customerBook suspendCustomerNamed: customerName].
	customerBook suspendCustomerNamed: customerName.
	
	self canNotPerformOperation: operationSuspendAnAlreadySuspendedCustomer in: customerBook failsWith: CantSuspend .
! !


!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/12/2021 17:26:03'!
canNotPerformOperation: operationWithInvalidCustomer in: customerBook failsWith: errorType
	
	[ operationWithInvalidCustomer value.
	self fail]
		on: errorType
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'MW 10/12/2021 17:32:16'!
validateAmountOfCustomersIn: customerBook withExpectedValue: expectedValue using: customerName and: operationExtraWithCustomer
	"| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: customerName."
	customerBook suspendCustomerNamed: customerName.
	
	operationExtraWithCustomer value.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: expectedValue equals: customerBook numberOfSuspendedCustomers.
	self assert: expectedValue equals: customerBook numberOfCustomers.
	"self assert: (customerBook includesCustomerNamed: paulMcCartney)"! !

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


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


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


!CustomerBook class methodsFor: 'as yet unclassified' stamp: 'MW 10/12/2021 17:01:58'!
instanceANewBookAndAddANewCustomerNamed: customerName
	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customerName.
	^customerBook! !
