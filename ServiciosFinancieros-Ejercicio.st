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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:44:43'!
test01TransferAffectsBalanceOfOriginAndDestinationAccounts
	
	| originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: (-100 * peso) equals: originAccount balance.
	self assert: (100 * peso) equals: destinationAccount balance.
	! !

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:45:30'!
test02ATransferKnowsItsTransferedAmount
	
	| aTransfer originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: 100 * peso equals: aTransfer transferedAmount.	! !

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:47:11'!
test03ATransferGetsRegisteredInTheOriginAccount
	
	| aTransfer originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: (originAccount hasTransferRegistered: aTransfer).! !

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:50:12'!
test04ATransferGetsRegisteredInTheDestinationAccount
	
	| aTransfer originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: (destinationAccount hasTransferRegistered: aTransfer).! !

!TransferTest methodsFor: 'test' stamp: 'TK 11/25/2021 20:37:30'!
test05TheCounterpartOfTheDepositLegIsTheWithdrawLeg
	
	| aTransfer originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: aTransfer depositLeg equals: aTransfer withdrawLeg counterpart! !

!TransferTest methodsFor: 'test' stamp: 'TK 11/25/2021 20:51:38'!
test06TheCounterpartOfTheWithdrawLegIsTheDepositLeg
	
	| aTransfer originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self assert: aTransfer withdrawLeg equals: aTransfer depositLeg counterpart! !

!TransferTest methodsFor: 'test' stamp: 'TK 11/25/2021 21:02:07'!
test07ATransferAmountCannotBeZero
	
	| originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	 
	self
		should: [ Transfer from: originAccount to: destinationAccount for: 0 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferWithValueZeroErrorDescription ]! !

!TransferTest methodsFor: 'test' stamp: 'TK 11/25/2021 21:02:22'!
test08ATransferAmountCannotBeNegative
	
	| originAccount destinationAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	 
	self
		should: [ Transfer from: originAccount to: destinationAccount for: -100 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferWithNegativeValueErrorDescription ]! !

!TransferTest methodsFor: 'test' stamp: 'TK 11/25/2021 21:08:08'!
test09ATransferCannotBeMadeToTheSameAccount
	
	| account |
	
	account  := ReceptiveAccount new.
	 
	self
		should: [ Transfer from: account to: account for: 100 * peso ]
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer transferToTheSameAccountErrorDescription ]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TK 11/18/2021 21:37:30'!
balanceValue

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


!Deposit methodsFor: 'value' stamp: 'TK 11/18/2021 21:37:48'!
balanceValue

	^ value! !

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

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:36'!
balanceValue
	^ self value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:36:26'!
counterpart

	^ transfer withdrawLeg! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 19:53:19'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:13'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:03:04'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 19:52:46'!
for: aValue from: aTransfer

	^ self new initializeFor: aValue from: aTransfer! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:47'!
balanceValue
	^ self value negated.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:36:36'!
counterpart

	^ transfer depositLeg! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:21:26'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:56'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:03:08'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:22:00'!
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


!Withdraw methodsFor: 'value' stamp: 'TK 11/18/2021 21:37:58'!
balanceValue

	^ value negated! !

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


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TK 11/18/2021 21:38:12'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue ] ifEmpty: [ 0 ]! !

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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:23:51'!
registerTransfer: aTransfer
	transfers add: aTransfer .! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 12:32:58'!
balanceValue
	^ amount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 19:38:51'!
depositLeg
	
	^ transferDeposit! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:34:50'!
initializeWithDepositLeg: aDepositLeg andWithdrawLeg: aWithdrawLeg for: anAmount
	amount := anAmount.
	transferDeposit := aDepositLeg.
	transferWithdraw := aWithdrawLeg.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 11:56:51'!
transferedAmount
	^ amount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 19:39:44'!
withdrawLeg
	
	^ transferWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 21:05:52'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 
	
	| transfer transferWithdraw transferDeposit |
	
	self validateTransferAmount: anAmountToTransfer.
	self validateTransferOriginAccount: anOriginAccount andDestinationAccount: aDestinationAccount.
	
	transfer := self new.

	transferWithdraw := TransferWithdraw register: anAmountToTransfer on: anOriginAccount fromTransfer: transfer.
	transferDeposit := TransferDeposit register: anAmountToTransfer on: aDestinationAccount fromTransfer: transfer.
	
	transfer initializeWithDepositLeg: transferDeposit andWithdrawLeg: transferWithdraw for: anAmountToTransfer.
	
	^ transfer! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 21:07:42'!
transferToTheSameAccountErrorDescription

	^ 'Cannot transfer to the same account'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 21:01:11'!
transferWithNegativeValueErrorDescription

	^ 'A transfer value cannot be negative'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 20:57:01'!
transferWithValueZeroErrorDescription

	^ 'A transfer value cannot be zero'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 21:00:40'!
validateTransferAmount: anAmountToTransfer

	(anAmountToTransfer = 0) ifTrue: [ self error: self transferWithValueZeroErrorDescription ].
	(anAmountToTransfer < 0) ifTrue: [ self error: self transferWithNegativeValueErrorDescription ]! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'TK 11/25/2021 21:07:21'!
validateTransferOriginAccount: anOriginAccount andDestinationAccount: aDestinationAccount

	(anOriginAccount = aDestinationAccount) ifTrue: [ self error: self transferToTheSameAccountErrorDescription ]! !
