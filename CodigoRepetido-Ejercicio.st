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

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:50:49'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney operationRemoveAnExistingCustomer |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: paulMcCartney.
	
	operationRemoveAnExistingCustomer := [ customerBook removeCustomerNamed: paulMcCartney ].
	
	self validateOperationRunningTimeOf: operationRemoveAnExistingCustomer withTime: 100.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:56:41'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook operationAddACustomerWithEmptyName expectedAssertions |
	customerBook := CustomerBook new.
	
	operationAddACustomerWithEmptyName := [ customerBook addCustomerNamed: ''].
	
	expectedAssertions := [ :anError | 		self validateEmptyCustomerAssertions: customerBook withError: anError ].
	
	self canNotPerformOperation: operationAddACustomerWithEmptyName inBook: customerBook failsWith: Error andValidates: expectedAssertions.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:56:41'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook operationRemoveAnInvalidCustomer paulMcCartney expectedAssertions |

	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	
	operationRemoveAnInvalidCustomer := [ customerBook removeCustomerNamed: paulMcCartney ].
	
	expectedAssertions := [ self validateCustomerBookHasOnlyJohnLennonAsCustomer: customerBook ].
	
	self canNotPerformOperation: operationRemoveAnInvalidCustomer inBook: customerBook failsWith: NotFound andValidates: expectedAssertions.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:57:46'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: paulMcCartney.
	
	self validateNumberOfCustomersInBook: customerBook withExpectedNumber: 1 applying: [] toCustomer: paulMcCartney.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:57:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney operationExtraWithACustomer |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: paulMcCartney.
	
	operationExtraWithACustomer := [ customerBook removeCustomerNamed: paulMcCartney ].
	
	self validateNumberOfCustomersInBook: customerBook withExpectedNumber: 0 applying: operationExtraWithACustomer toCustomer: paulMcCartney .

	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:56:41'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook operationSuspendAnInvalidCustomer ringoStarr expectedAssertions |

	ringoStarr := 'Ringo Starr'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: 'John Lennon'.
	
	operationSuspendAnInvalidCustomer := [ customerBook suspendCustomerNamed: ringoStarr ].
	
	expectedAssertions := [ self validateCustomerBookHasOnlyJohnLennonAsCustomer: customerBook ].
	
	self canNotPerformOperation: operationSuspendAnInvalidCustomer inBook: customerBook failsWith: CantSuspend andValidates: expectedAssertions.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'TK 10/13/2021 18:56:41'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook operationSuspendAnAlreadySuspendedCustomer johnLennon expectedAssertions |

	johnLennon := 'John Lennon'.
	customerBook := CustomerBook instanceANewBookAndAddANewCustomerNamed: johnLennon.
	
	operationSuspendAnAlreadySuspendedCustomer := [ customerBook suspendCustomerNamed: johnLennon ].
	customerBook suspendCustomerNamed: johnLennon.
	
	expectedAssertions := [ self validateCustomerBookHasOnlyJohnLennonAsCustomer: customerBook ].
	
	self canNotPerformOperation: operationSuspendAnAlreadySuspendedCustomer inBook: customerBook failsWith: CantSuspend andValidates: expectedAssertions.
! !


!CustomerBookTest methodsFor: 'tests - private' stamp: 'TK 10/13/2021 18:56:41'!
canNotPerformOperation: operationWithInvalidCustomer inBook: customerBook failsWith: errorType andValidates: expectedAssertions 
	
	[ operationWithInvalidCustomer value.
	self fail ]
		on: errorType
		do: [ :anError | (#expectedAssertions asMessageWith: anError) value ].! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'TK 10/13/2021 18:47:59'!
validateCustomerBookHasOnlyJohnLennonAsCustomer: customerBook
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: 'John Lennon').
! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'TK 10/13/2021 18:45:56'!
validateEmptyCustomerAssertions: customerBook withError: anError

	self assert: anError messageText = (CustomerBook customerCanNotBeEmptyErrorMessage).
	self assert: customerBook isEmpty.! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'TK 10/13/2021 18:57:46'!
validateNumberOfCustomersInBook: customerBook withExpectedNumber: value applying: operationExtraWithCustomer toCustomer: customerName

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
