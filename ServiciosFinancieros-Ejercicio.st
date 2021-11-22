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

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:48:20'!
test05CounterpartOfTheOriginAccountInTransferIsTheDestinationAccount
	
	| aTransfer originAccount destinationAccount aCounterpart |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	aCounterpart := originAccount counterpartOf: aTransfer.
	
	self assert: destinationAccount equals: aCounterpart.	! !

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:48:50'!
test06CounterpartOfTheDestinationAccountInTransferIsTheOriginAccount
	
	| aTransfer originAccount destinationAccount aCounterpart |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	aCounterpart := destinationAccount counterpartOf: aTransfer.
	
	self assert: originAccount equals: aCounterpart.	! !

!TransferTest methodsFor: 'test' stamp: 'MW 11/22/2021 15:49:40'!
test07AnAccountNotInvolvedInATransferRaisesAnErrorWhenAskedForItsCounterpart
	
	| aTransfer originAccount destinationAccount nonTransferAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	nonTransferAccount := ReceptiveAccount new.
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100* peso.
	
	self
		should: [ nonTransferAccount counterpartOf: aTransfer ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount accountNotInvolvedInTransferErrorDescription ]! !


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
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:36'!
balanceValue
	^ self value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:59:19'!
initializeFor: aValue

	value := aValue ! !

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


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:57:47'!
balanceValue
	^ self value negated.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 14:59:30'!
initializeFor: aValue

	value := aValue ! !

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:43:23'!
counterpartOf: aTransfer
	
	(transfers includes: aTransfer) ifFalse: [^ self class error: self class accountNotInvolvedInTransferErrorDescription ].
	aTransfer originAccount  = self ifTrue:[^ aTransfer destinationAccount ].
	^ aTransfer originAccount .! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:23:51'!
registerTransfer: aTransfer
	transfers add: aTransfer .! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:25:04'!
registerTransferAsADestinationAccount: aTransfer 
	TransferDeposit register: aTransfer transferedAmount on: self.
	self registerTransfer: aTransfer.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:25:12'!
registerTransferAsAnOriginAccount: aTransfer 
	TransferWithdraw register: aTransfer transferedAmount on: self.
	self registerTransfer: aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:41:28'!
accountNotInvolvedInTransferErrorDescription
	^ 'the account is not involved in this transaction'! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount destinationAccount originAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 12:32:58'!
balanceValue
	^ amount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 12:05:13'!
destinationAccount
	^ destinationAccount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:34:52'!
initializeTransferFrom: anOriginAccount to: aDestinationAccount for: anAmount
	amount := anAmount.
	destinationAccount := aDestinationAccount.
	originAccount  := anOriginAccount .! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:31:24'!
originAccount
	^originAccount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 11:56:51'!
transferedAmount
	^ amount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MW 11/22/2021 15:12:42'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 
	
	| transfer|
	
	transfer := self new initializeTransferFrom: anOriginAccount to: aDestinationAccount for: anAmountToTransfer .

	anOriginAccount registerTransferAsAnOriginAccount: transfer.
	aDestinationAccount registerTransferAsADestinationAccount: transfer.

	
	^transfer! !
