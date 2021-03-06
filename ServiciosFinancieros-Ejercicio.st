!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anAccount anotherAccount anotherPortfolio thirdPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:35:37'!
test01AnEmptyPortfolioHasBalanceZero

	self assert: 0 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:47:28'!
test02APortfolioWithOneAccountHasTheAccountBalance

	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	
	self assert: 100 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:51:14'!
test03APortfolioWithMultipleAccountsHasTheAccountsBalance

	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	self registerADepositOf: 200* peso on: anotherAccount andAddTheAccountTo: aPortfolio.
	
	self assert: 300 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:38:23'!
test04AnEmptyPortfolioDoesNotHaveRegisteredTransactions

	| aDeposit |
	aDeposit :=Deposit register: 100 * peso on: anAccount.
	self deny: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:51:53'!
test05APortfolioWithOneAccountHasTheAccountRegisteredTransactions

	| aDeposit |	
	aDeposit := self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	self assert: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:53:17'!
test06APortfolioWithMultipleAccountsHasTheAccountsRegisteredTransactions

	| aDeposit|

	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	aDeposit := self registerADepositOf: 200* peso on: anotherAccount andAddTheAccountTo: aPortfolio.

	self assert: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:35:37'!
test07AnEmptyPortfolioReturnsAnEmptyListOfTransactions
	self assert: aPortfolio transactions isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:53:38'!
test08APortfolioWithOneAccountReturnsTheAccountTransactions

	| aDeposit |
	 
	aDeposit := 	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	
	self assert: aPortfolio transactions includes: aDeposit.! !

!PortfolioTest methodsFor: 'tests' stamp: 'MW 11/26/2021 14:56:30'!
test09APortfolioWithMutipleAccountsReturnsTheAccountsTransactions

	| aDeposit anotherDeposit|

	aDeposit := self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: aPortfolio.
	anotherDeposit := self registerADepositOf: 200* peso on: anotherAccount andAddTheAccountTo: aPortfolio.	
	
	self assert: (OrderedCollection with: aDeposit with: anotherDeposit) equals: aPortfolio transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 18:34:02'!
test10APortfolioWithAnEmptyPortfilioAddedHasBalanceZero

	aPortfolio addPortfolio: Portfolio new.	
	self assert: 0 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 18:36:34'!
test11APortfolioWithAnotherPortfolioWithTransactionsHasTheRightBalance

	aPortfolio addPortfolio: 	anotherPortfolio.
	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.
	self assert: 100 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:03:29'!
test12APortfolioWithMultiplePortfoliosWithTransactionsHasTheRightBalance

	aPortfolio addPortfolio: 	anotherPortfolio.
	aPortfolio addPortfolio: 	thirdPortfolio.
	
	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.
	self registerADepositOf: 100* peso on: anotherAccount andAddTheAccountTo: thirdPortfolio.
	
	self assert: 200 * peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 18:40:59'!
test13APortfolioWithAnotherPortfolioWithTransactionsHasTheOtherPortfolioTransactionsRegistered

	| aDeposit |

	aPortfolio addPortfolio: 	anotherPortfolio.
	aDeposit := self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.
	self assert: (aPortfolio hasRegistered: aDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:05:07'!
test14APortfolioWithMultiplePortfoliosWithTransactionsHasTheOtherPortfoliosTransactionsRegistered

	| aDeposit |

	aPortfolio addPortfolio: 	anotherPortfolio.
	aPortfolio addPortfolio: 	thirdPortfolio.
	
	self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.
	aDeposit := self registerADepositOf: 100* peso on: anotherAccount andAddTheAccountTo: thirdPortfolio.

	self assert: (aPortfolio hasRegistered: aDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:17:32'!
test15APortfolioWithAnotherPortfolioWithTransactionsHasTheOtherPortfolioTransactions

	| aDeposit |

	aPortfolio addPortfolio: 	anotherPortfolio.
	aDeposit := self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.

	self assert: (OrderedCollection with: aDeposit) equals: (aPortfolio transactions)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:18:11'!
test16APortfolioWithMultiplePortfoliosWithTransactionsHasTheOtherPortfoliosTransactions

	| aDeposit anotherDeposit |

	aPortfolio addPortfolio: 	anotherPortfolio.
	aPortfolio addPortfolio: 	thirdPortfolio.

	aDeposit := self registerADepositOf: 100* peso on: anAccount andAddTheAccountTo: anotherPortfolio.
	anotherDeposit := self registerADepositOf: 100* peso on: anotherAccount andAddTheAccountTo: thirdPortfolio.

	self assert: (OrderedCollection with: aDeposit with: anotherDeposit) equals: (aPortfolio transactions)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:24:28'!
test17APortfolioCannotAddTheSameAccountTwice

	aPortfolio addAccount: anAccount.
	
	self
		should: [ aPortfolio addAccount: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotAddTheSameAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:45:04'!
test18APortfolioCannotAddAnAccountThatIsInAChildPortfolio

	aPortfolio addPortfolio: anotherPortfolio.
	anotherPortfolio addAccount: anAccount.
	
	self
		should: [ aPortfolio addAccount: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotAddAnAccountAChildPortfolioAlreadyHasErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:45:40'!
test19APortfolioCannotBeAddedToItself
	
	self
		should: [ aPortfolio addPortfolio: aPortfolio ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio aPortfolioCannotBeAddedToItselfErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 19:55:38'!
test20APortfolioCannotAddAnAccountThatIsInAParentPortfolio
	
	aPortfolio addAccount: anAccount.
	aPortfolio addPortfolio: anotherPortfolio.
	
	self
		should: [ anotherPortfolio addAccount: anAccount ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotAddAnAccountAParentPortfolioAlreadyHasErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'TK 11/26/2021 20:01:24'!
test21APortfolioWithAnAccountCannotAddAPortfolioWithTheSameAccount
	
	aPortfolio addAccount: anAccount.
	anotherPortfolio addAccount: anAccount.
	
	self
		should: [ aPortfolio addPortfolio: anotherPortfolio ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotAddAPortfolioThatHasAnAccountThisPortfolioAlreadyHasErrorDescription ]! !


!PortfolioTest methodsFor: 'setup' stamp: 'TK 11/26/2021 19:03:11'!
setUp
	
	aPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	anotherPortfolio := Portfolio new.
	thirdPortfolio := 	Portfolio new.! !


!PortfolioTest methodsFor: 'test - private' stamp: 'MW 11/26/2021 14:50:54'!
registerADepositOf: anAmount on: theAccount andAddTheAccountTo: thePortfolio
	
	| aDeposit |
	aDeposit := Deposit register: anAmount on: theAccount.
	thePortfolio addAccount: theAccount .	
	^aDeposit! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'setup' stamp: 'TK 11/26/2021 11:06:50'!
setUp

	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.! !


!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test01TransferAffectsBalanceOfOriginAndDestinationAccounts

	Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	
	self assert: (-100 * peso) equals: anOriginAccount balance.
	self assert: (100 * peso) equals: aDestinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test02ATransferKnowsItsTransferedAmount
	
	| aTransfer |
	aTransfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	self assert: 100 * peso equals: aTransfer transferedAmount.	! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test03ATransferGetsRegisteredInTheOriginAccount
	
	| aTransfer |
	aTransfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	self assert: (anOriginAccount hasTransferRegistered: aTransfer).! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test04ATransferGetsRegisteredInTheDestinationAccount
	
	| aTransfer |
	aTransfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	self assert: (aDestinationAccount hasTransferRegistered: aTransfer).! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test05TheCounterpartOfTheDepositLegIsTheWithdrawLeg
	
	| aTransfer |
	aTransfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	self assert: aTransfer depositLeg equals: aTransfer withdrawLeg counterpart! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test06TheCounterpartOfTheWithdrawLegIsTheDepositLeg
	
	| aTransfer |
	aTransfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100* peso.
	self assert: aTransfer withdrawLeg equals: aTransfer depositLeg counterpart! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test07ATransferAmountCannotBeZero

	self
		should: [ Transfer from: anOriginAccount to: aDestinationAccount for: 0 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferWithValueZeroErrorDescription ]! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:50'!
test08ATransferAmountCannotBeNegative

	self
		should: [ Transfer from: anOriginAccount to: aDestinationAccount for: -100 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferWithNegativeValueErrorDescription ]! !

!TransferTest methodsFor: 'tests' stamp: 'TK 11/26/2021 11:06:41'!
test09ATransferCannotBeMadeToTheSameAccount
	
	self
		should: [ Transfer from: anOriginAccount to: anOriginAccount for: 100 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferToTheSameAccountErrorDescription ]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TK 11/29/2021 09:53:56'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 20:46:29'!
register: aValue on: account fromTransfer: aTransfer

	| transaction |
	
	transaction := self for: aValue from: aTransfer.
	account registerTransfer: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'TK 11/29/2021 09:55:06'!
affectBalance: aBalance

	^ aBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'TK 11/25/2021 19:53:19'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer! !


!TransferDeposit methodsFor: 'transfer' stamp: 'TK 11/25/2021 20:36:26'!
counterpart

	^ transfer withdrawLeg! !


!TransferDeposit methodsFor: 'value' stamp: 'TK 11/29/2021 09:57:26'!
affectBalance: aBalance

	^ aBalance + self value.! !

!TransferDeposit methodsFor: 'value' stamp: 'MW 11/22/2021 14:57:13'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'MW 11/22/2021 15:03:04'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferDeposit class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 19:52:46'!
for: aValue from: aTransfer

	^ self new initializeFor: aValue from: aTransfer! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'TK 11/25/2021 20:21:26'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer! !


!TransferWithdraw methodsFor: 'transfer' stamp: 'TK 11/25/2021 20:36:36'!
counterpart

	^ transfer depositLeg! !


!TransferWithdraw methodsFor: 'value' stamp: 'TK 11/29/2021 09:57:57'!
affectBalance: aBalance

	^ aBalance - self value! !

!TransferWithdraw methodsFor: 'value' stamp: 'MW 11/22/2021 14:57:56'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'MW 11/22/2021 15:03:08'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 20:22:00'!
for: aValue from: aTransfer

	^ self new initializeFor: aValue from: aTransfer! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'TK 11/29/2021 09:56:20'!
affectBalance: aBalance

	^ aBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'TK 11/18/2021 21:35:47'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios parentPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'TK 11/26/2021 18:32:16'!
initialize

	accounts := OrderedCollection new.
	portfolios := OrderedCollection new! !


!Portfolio methodsFor: 'main protocol' stamp: 'TK 11/29/2021 09:13:09'!
addAccount: aReceptiveAccount 
	
	self validateThatPortfolioDoesNotHaveAccount: aReceptiveAccount.

	self validateThatChildPortfoliosDoNotHaveAccount: aReceptiveAccount.

	self validateThatParentPortfolioDoesNotHaveAccount: aReceptiveAccount.

	accounts add: aReceptiveAccount! !

!Portfolio methodsFor: 'main protocol' stamp: 'TK 11/29/2021 09:47:21'!
addPortfolio: aPortfolio 
	
	self validateThatPortfolioIsNotSelf: aPortfolio.

	self validateThatPortfolioDoesNotHaveAnAccountFrom: aPortfolio.

	portfolios add: aPortfolio.
	aPortfolio beChildPortfolioOf: self! !

!Portfolio methodsFor: 'main protocol' stamp: 'TK 11/26/2021 18:33:12'!
balance

	| accountsBalance portfoliosBalance |

	accountsBalance := accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ accountsBalance := 0 * peso ].
	portfoliosBalance := portfolios sum: [ :aPortfolio | aPortfolio balance ] ifEmpty: [ portfoliosBalance := 0 * peso ].

	^ accountsBalance + portfoliosBalance! !

!Portfolio methodsFor: 'main protocol' stamp: 'TK 11/26/2021 19:20:35'!
hasRegistered: aTransaction 

	| accountsFound portfoliosFound |
	accountsFound := true.
	portfoliosFound := true.
	accounts detect: [ :anAccount | anAccount hasRegistered: aTransaction ] ifNone: [ accountsFound := false ].
	portfolios detect: [ :aPortfolio | aPortfolio hasRegistered: aTransaction ] ifNone: [ portfoliosFound := false ].
	^ accountsFound or: [ portfoliosFound ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'TK 11/26/2021 19:20:02'!
transactions
	| accountsTransactions |
	
	accountsTransactions := OrderedCollection new.
	self addTransactionsTo: accountsTransactions.
	^ accountsTransactions! !


!Portfolio methodsFor: 'private' stamp: 'TK 11/26/2021 19:14:33'!
addTransactionsTo: aTransactionsList
	
	accounts do: [ :anAccount | aTransactionsList addAllLast: anAccount transactions ].
	portfolios do: [ :aPortfolio | aTransactionsList addAllLast: aPortfolio transactions ].! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/26/2021 19:50:49'!
beChildPortfolioOf: aPortfolio 
	
	parentPortfolio := aPortfolio! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/26/2021 19:34:19'!
hasAccount: aReceptiveAccount 

	^ accounts includes: aReceptiveAccount! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:42:29'!
ifPortfolio: aPortfolio hasAccount: aReceptiveAccount execute: anOperation

	(aPortfolio hasAccount: aReceptiveAccount) ifTrue: [		anOperation value ]! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:43:30'!
validateThatChildPortfoliosDoNotHaveAccount: aReceptiveAccount

	portfolios do: [ :aPortfolio |
		self ifPortfolio: aPortfolio hasAccount: aReceptiveAccount execute: [ self error: self class cannotAddAnAccountAChildPortfolioAlreadyHasErrorDescription ]
	]! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:44:08'!
validateThatParentPortfolioDoesNotHaveAccount: aReceptiveAccount

	(parentPortfolio = nil) ifFalse: [
		self ifPortfolio: parentPortfolio hasAccount: aReceptiveAccount execute: [ self error: self class cannotAddAnAccountAParentPortfolioAlreadyHasErrorDescription ]
	]! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:44:55'!
validateThatPortfolioDoesNotHaveAccount: aReceptiveAccount

	self ifPortfolio: self hasAccount: aReceptiveAccount execute: [ self error: self class cannotAddTheSameAccountTwiceErrorDescription ]! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:45:50'!
validateThatPortfolioDoesNotHaveAnAccountFrom: aPortfolio

	accounts do: [ :anAccount |
		self ifPortfolio: aPortfolio hasAccount: anAccount execute: [ self error: self class cannotAddAPortfolioThatHasAnAccountThisPortfolioAlreadyHasErrorDescription ]
	]! !

!Portfolio methodsFor: 'private' stamp: 'TK 11/29/2021 09:47:34'!
validateThatPortfolioIsNotSelf: aPortfolio

	(aPortfolio = self) ifTrue: [ self error: self class aPortfolioCannotBeAddedToItselfErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'TK 11/26/2021 19:40:07'!
aPortfolioCannotBeAddedToItselfErrorDescription

	^ 'A portfolio cannot be added to itself'! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'TK 11/26/2021 19:58:52'!
cannotAddAPortfolioThatHasAnAccountThisPortfolioAlreadyHasErrorDescription

	^ 'The other portfolio has an account this portfolio already has'! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'TK 11/26/2021 19:54:51'!
cannotAddAnAccountAChildPortfolioAlreadyHasErrorDescription

	^ 'A child portfolio has this account'! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'TK 11/26/2021 19:54:39'!
cannotAddAnAccountAParentPortfolioAlreadyHasErrorDescription

	^ 'The parent portfolio has this account'! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'TK 11/26/2021 19:25:36'!
cannotAddTheSameAccountTwiceErrorDescription

	^ 'Cannot add the same account twice'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'MW 11/22/2021 15:22:32'!
initialize

	transactions := OrderedCollection new.
	transfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TK 11/29/2021 10:05:12'!
balance

	| balance |
	balance := 0.
	transactions do: [ :aTransaction | balance := aTransaction affectBalance: balance ].
	^ balance! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 11/22/2021 15:21:50'!
hasTransferRegistered: aTransfer

	^ transfers includes: aTransfer. 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 11/22/2021 15:23:51'!
registerTransfer: aTransfer
	transfers add: aTransfer .! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'TK 11/25/2021 20:34:50'!
initializeWithDepositLeg: aDepositLeg andWithdrawLeg: aWithdrawLeg for: anAmount
	amount := anAmount.
	transferDeposit := aDepositLeg.
	transferWithdraw := aWithdrawLeg.! !


!Transfer methodsFor: 'main protocol' stamp: 'MW 11/22/2021 12:32:58'!
balanceValue
	^ amount.! !

!Transfer methodsFor: 'main protocol' stamp: 'TK 11/25/2021 19:38:51'!
depositLeg
	
	^ transferDeposit! !

!Transfer methodsFor: 'main protocol' stamp: 'MW 11/22/2021 11:56:51'!
transferedAmount
	^ amount.! !

!Transfer methodsFor: 'main protocol' stamp: 'TK 11/25/2021 19:39:44'!
withdrawLeg
	
	^ transferWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 21:05:52'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 
	
	| transfer transferWithdraw transferDeposit |
	
	self validateTransferAmount: anAmountToTransfer.
	self validateTransferOriginAccount: anOriginAccount andDestinationAccount: aDestinationAccount.
	
	transfer := self new.

	transferWithdraw := TransferWithdraw register: anAmountToTransfer on: anOriginAccount fromTransfer: transfer.
	transferDeposit := TransferDeposit register: anAmountToTransfer on: aDestinationAccount fromTransfer: transfer.
	
	transfer initializeWithDepositLeg: transferDeposit andWithdrawLeg: transferWithdraw for: anAmountToTransfer.
	
	^ transfer! !

!Transfer class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 21:00:40'!
validateTransferAmount: anAmountToTransfer

	(anAmountToTransfer = 0) ifTrue: [ self error: self transferWithValueZeroErrorDescription ].
	(anAmountToTransfer < 0) ifTrue: [ self error: self transferWithNegativeValueErrorDescription ]! !

!Transfer class methodsFor: 'instance creation' stamp: 'TK 11/25/2021 21:07:21'!
validateTransferOriginAccount: anOriginAccount andDestinationAccount: aDestinationAccount

	(anOriginAccount = aDestinationAccount) ifTrue: [ self error: self transferToTheSameAccountErrorDescription ]! !


!Transfer class methodsFor: 'error descriptions' stamp: 'TK 11/25/2021 21:07:42'!
transferToTheSameAccountErrorDescription

	^ 'Cannot transfer to the same account'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'TK 11/25/2021 21:01:11'!
transferWithNegativeValueErrorDescription

	^ 'A transfer value cannot be negative'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'TK 11/25/2021 20:57:01'!
transferWithValueZeroErrorDescription

	^ 'A transfer value cannot be zero'! !
