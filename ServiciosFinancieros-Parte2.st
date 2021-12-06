!classDefinition: #AccountNetTransferTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #AccountNetTransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountNetTransferTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:39:35'!
test01AReceptiveAccountWithNoTransfersHasNetTransferZero

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	
	self assert: 0 * peso equals: anAccount netTransfer! !

!AccountNetTransferTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:39:42'!
test02AReceptiveAccountWithATransferAsAnOriginAccountHasNegativeNetTransfer

	| anOriginAccount aDestinationAccount |
	
	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: anOriginAccount to: aDestinationAccount.

	self assert: -100 * peso equals: anOriginAccount netTransfer! !

!AccountNetTransferTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:39:49'!
test03AReceptiveAccountWithATransferAsADestinationAccountHasPositiveNetTransfer

	| anOriginAccount aDestinationAccount |
	
	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: anOriginAccount to: aDestinationAccount.

	self assert: 100 * peso equals: aDestinationAccount netTransfer! !

!AccountNetTransferTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:39:56'!
test04APortfolioWithoutAccountsHasZeroNetTransfer
	
	| aPortfolio |

	aPortfolio := Portfolio new.
	
	self assert: 0 * peso equals: aPortfolio netTransfer! !

!AccountNetTransferTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:02'!
test05APortfolioWithAccountsWithTransfersHasTheRightNetTransfer
	
	| aPortfolio anOriginAccount |
	
	anOriginAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: anOriginAccount.
	
	Transfer amount: 100 * peso from: anOriginAccount to: ReceptiveAccount new.
	
	self assert: -100 * peso equals: aPortfolio netTransfer! !


!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:09'!
test01AReceptiveAccountWithoutTransactionsHasAnEmptySummary

	self assert: ReceptiveAccount new summary equals: (OrderedCollection with: 'Balance = 0 pesos').! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:17'!
test02AReceptiveAccountWithOneDepositHasTheDepositInTheSummary

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.

	self assert: (OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos') equals: anAccount summary! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:27'!
test03AReceptiveAccountWithMultipleDepositsHasTheDepositsInTheSummary

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	Deposit register: 20 * peso on: anAccount.

	self assert: (OrderedCollection with: 'Depósito por 10 pesos' with: 'Depósito por 20 pesos' with: 'Balance = 30 pesos') equals: anAccount summary! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:35'!
test04AReceptiveAccountWithOneWithdrawHasTheWithdrawInTheSummary

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Withdraw register: 10 * peso on: anAccount.

	self assert: (OrderedCollection with: 'Extracción por 10 pesos' with: 'Balance = -10 pesos') equals: anAccount summary! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:42'!
test05AReceptiveAccountWithMultipleWithdrawsHasTheWithdrawsInTheSummary

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Withdraw register: 10 * peso on: anAccount.
	Withdraw register: 20 * peso on: anAccount.

	self assert: (OrderedCollection with: 'Extracción por 10 pesos' with: 'Extracción por 20 pesos' with: 'Balance = -30 pesos') equals: anAccount summary! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:49'!
test06AReceptiveAccountWithATransferAsAnOriginAccountHasTheTransferWithdrawInTheSummary

	| anAccount anotherAccount |
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: anAccount to: anotherAccount.

	self assert: (OrderedCollection with: 'Salida por transferencia de 100 pesos' with: 'Balance = -100 pesos') equals: anAccount summary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:40:57'!
test07AReceptiveAccountWithATransferAsADestinationAccountHasTheTransferDepositInTheSummary

	| anAccount anotherAccount |
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: anAccount to: anotherAccount.

	self assert: (OrderedCollection with: 'Entrada por transferencia de 100 pesos' with: 'Balance = 100 pesos') equals: anotherAccount summary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:41:04'!
test08APortfolioWithoutTransactionsHasAnEmptySummary

	self assert: (OrderedCollection with: 'Balance = 0 pesos') equals: Portfolio new summary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:41:10'!
test09APortfolioWithAnAccountHasTheAccountTransactionsInItsSummary
	
	| aPortfolio anAccount|
	
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: anAccount.
	Deposit register: 100 * peso on: anAccount. 

	self assert: (OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos') equals: aPortfolio summary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:41:16'!
test10APortfolioWithMultipleAccountsHasTheAccountsTransactionsInItsSummary
	
	| aPortfolio  anAccount anotherAccount expectedSummary|
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: anAccount with: anotherAccount .

	Deposit register: 100 * peso on: anAccount. 
	Transfer amount: 200 *peso from: anAccount to: anotherAccount.

	expectedSummary := OrderedCollection new.
	expectedSummary add: 'Depósito por 100 pesos'.
	expectedSummary add: 'Salida por transferencia de 200 pesos'.
	expectedSummary add: 'Entrada por transferencia de 200 pesos'.
	expectedSummary add: 'Balance = 100 pesos'.

	self assert: expectedSummary equals: aPortfolio summary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'MW 12/4/2021 12:41:22'!
test11APortfolioWithAnAccountAndAPortfolioWithAnotherAccountHasEveryAccountSummaryInItsSummary
	
	| aPortfolio anotherPortfolio anAccount anotherAccount expectedSummary|
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: anAccount.
	anotherPortfolio := Portfolio with: anotherAccount.
	Deposit register: 100 * peso on: anAccount. 
	Transfer amount: 200 *peso from: anAccount to: anotherAccount.
	
	aPortfolio add: anotherPortfolio .
	
	expectedSummary := OrderedCollection new.
	expectedSummary add: 'Depósito por 100 pesos'.
	expectedSummary add: 'Salida por transferencia de 200 pesos'.
	expectedSummary add: 'Entrada por transferencia de 200 pesos'.
	expectedSummary add: 'Balance = 100 pesos'.

	self assert: expectedSummary equals: aPortfolio summary.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreeTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioTreeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:05:05'!
test01ANamelessPortfolioHasAnEmptyPortfolioTree

	self assert: OrderedCollection new equals: Portfolio new portfolioTree! !

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:11:32'!
test02APortfolioWithoutAnyChildHasAPortfolioTreeOnlyWithItsName

	self assert: (OrderedCollection with: 'Test portfolio') equals: (Portfolio named: 'Test portfolio') portfolioTree! !

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:10:08'!
test03APortfolioWithAChildReceptiveAccountHasTheCorrectPortfolioTree

	| aPortfolio |
	
	aPortfolio := Portfolio named: 'Test portfolio' with: (ReceptiveAccount named: 'Test account').

	self assert: (OrderedCollection with: 'Test portfolio' with: '    Test account') equals: aPortfolio portfolioTree! !

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:11:07'!
test04APortfolioWithMultipleChildReceptiveAccountsHasTheCorrectPortfolioTree

	| aPortfolio |
	
	aPortfolio := Portfolio named: 'Test portfolio' with: (ReceptiveAccount named: 'Test account') with: (ReceptiveAccount named: 'Another test account').

	self assert: (OrderedCollection with: 'Test portfolio' with: '    Test account' with: '    Another test account') equals: aPortfolio portfolioTree! !

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:10:00'!
test05APortfolioWithAChildPortfolioHasTheCorrectPortfolioTree

	| aPortfolio |
	
	aPortfolio := Portfolio named: 'Test portfolio' with: (Portfolio named: 'Child test portfolio').
	self assert: (OrderedCollection with: 'Test portfolio' with: '    Child test portfolio') equals: aPortfolio portfolioTree! !

!PortfolioTreeTest methodsFor: 'tests' stamp: 'MW 12/4/2021 20:10:46'!
test06APortfoliowithAChildPortfolioThatHasAChildReceptiveAccountHasTheCorrectPortfolioTree

	| aPortfolio |
	
	aPortfolio := Portfolio named: 'Test portfolio' with: (Portfolio named: 'Child test portfolio' with: (ReceptiveAccount named: 'Child test account')).
	self assert: (OrderedCollection with: 'Test portfolio' with: '    Child test portfolio' with: '        Child test account') equals: aPortfolio portfolioTree! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Account methodsFor: 'main protocol' stamp: 'TK 12/5/2021 20:35:46'!
accept: anExpressionVisitor

	self subclassResponsibility! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'TK 11/29/2021 21:12:41'!
summary

	self subclassResponsibility! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Parte2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents portfolioName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Portfolio methodsFor: 'initialization' stamp: 'TK 12/3/2021 16:32:58'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'MW 12/4/2021 12:46:28'!
initializeAPortfolioNamed: aPortfolioName with: aReceptiveAccount 

	portfolioName := aPortfolioName.
	accounts := OrderedCollection with: aReceptiveAccount.
	parents := OrderedCollection new! !

!Portfolio methodsFor: 'initialization' stamp: 'MW 12/4/2021 12:49:22'!
initializeAPortfolioNamed: aPortfolioName with: aReceptiveAccount with: anotherReceptiveAccount 
	portfolioName := aPortfolioName.
	accounts := OrderedCollection with: aReceptiveAccount with: anotherReceptiveAccount .
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'TK 12/3/2021 16:31:13'!
initializeWith: aPortfolioName 

	portfolioName := aPortfolioName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'MW 12/4/2021 19:42:52'!
name
	^portfolioName ! !


!Portfolio methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:38:41'!
accept: anExpressionVisitor

	anExpressionVisitor visitPortfolio: self! !

!Portfolio methodsFor: 'main protocol' stamp: 'MW 11/30/2021 11:13:38'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'MW 12/2/2021 21:34:28'!
netTransfer

	^(AccountNetTransfer of: self) compute.! !

!Portfolio methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:32:00'!
portfolioTree
	
	^(PortfolioTree of: self) compute.! !

!Portfolio methodsFor: 'main protocol' stamp: 'MW 12/2/2021 20:58:57'!
summary
	
	^ (AccountSummary of: self) compute.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

!Portfolio methodsFor: 'main protocol' stamp: 'TK 12/5/2021 20:42:49'!
withAccountsDo: anOperation

	accounts do: [ :anAccount | anOperation value: anAccount ]! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Parte2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'TK 12/3/2021 16:30:49'!
named: aPortfolioName 
	
	^ self new initializeWith: aPortfolioName! !

!Portfolio class methodsFor: 'instance creation' stamp: 'MW 12/4/2021 12:46:28'!
named: aPortfolioName with: aReceptiveAccount 
	
	^ self new initializeAPortfolioNamed: aPortfolioName with: aReceptiveAccount! !

!Portfolio class methodsFor: 'instance creation' stamp: 'MW 12/4/2021 12:47:02'!
named: aPortfolioName with: aReceptiveAccount with: anotherReceptiveAccount 
	^self new initializeAPortfolioNamed: aPortfolioName with: aReceptiveAccount with: anotherReceptiveAccount .! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Parte2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions receptiveAccountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'TK 12/3/2021 16:39:55'!
initializeWith: aReceptiveAccountName 

	receptiveAccountName := aReceptiveAccountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:39:03'!
accept: anExpressionVisitor

	anExpressionVisitor visitReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 11/30/2021 10:30:19'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:44:20'!
name

	^ receptiveAccountName
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 12/2/2021 21:32:33'!
netTransfer

 	^(AccountNetTransfer of: self) compute.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MW 12/2/2021 20:54:57'!
summary
	
	^ (AccountSummary of: self) compute.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Parte2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'TK 12/3/2021 16:39:43'!
named: aReceptiveAccountName

	^ self new initializeWith: aReceptiveAccountName! !


!classDefinition: #AccountNetTransfer category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountNetTransfer
	instanceVariableNames: 'account netTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountNetTransfer methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:10:38'!
compute
	account transactions do: [ :aTransaction | aTransaction accept: self	].
	^netTransfer.! !

!AccountNetTransfer methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:09:25'!
visitTransferDepositLeg: aDeposit

	netTransfer := netTransfer + aDeposit value! !

!AccountNetTransfer methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:09:19'!
visitTransferWithdrawLeg: aTransferWithdrawLeg

	netTransfer := netTransfer - aTransferWithdrawLeg value! !


!AccountNetTransfer methodsFor: 'initialization' stamp: 'MW 12/3/2021 10:04:05'!
initializeWith: anAccount
	account := anAccount.
	netTransfer := 0 * peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountNetTransfer class' category: 'ServiciosFinancieros-Parte2'!
AccountNetTransfer class
	instanceVariableNames: ''!

!AccountNetTransfer class methodsFor: 'as yet unclassified' stamp: 'MW 12/2/2021 21:28:27'!
of: anAccount
	^self new initializeWith: anAccount
	! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountSummary
	instanceVariableNames: 'account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummary methodsFor: 'initialization' stamp: 'MW 12/3/2021 10:17:57'!
initializeWith: anAccount	
	summary := OrderedCollection new.
	account := anAccount
	! !


!AccountSummary methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:18:02'!
compute
	account transactions do: [ :aTransaction | aTransaction accept: self	].
	summary add: ('Balance = ', account balance asString).
	^ summary
	! !

!AccountSummary methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:07:47'!
visitDeposit: aDeposit

	summary add: ('Depósito por ', aDeposit value asString)! !

!AccountSummary methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:02:21'!
visitTransferDepositLeg: aDepositLeg

	summary add: ('Entrada por transferencia de ', aDepositLeg value asString)! !

!AccountSummary methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:03:56'!
visitTransferWithdrawLeg: aWithdrawLeg

	summary add: ('Salida por transferencia de ', aWithdrawLeg value asString)! !

!AccountSummary methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:17:06'!
visitWithdraw: aWithdraw

	summary add: ('Extracción por ', aWithdraw value asString)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Parte2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'MW 12/2/2021 20:47:29'!
of: anAccount
	^self new initializeWith: anAccount! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'TK 12/3/2021 16:01:32'!
accept: anExpressionVisitor

	self subclassResponsibility! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:06:51'!
accept: anExpressionVisitor

	anExpressionVisitor visitDeposit: self! !

!Deposit methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

!Deposit methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Parte2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferLeg methodsFor: 'main protocol' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Parte2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:02:21'!
accept: anExpressionVisitor

	anExpressionVisitor visitTransferDepositLeg: self! !

!TransferDepositLeg methodsFor: 'main protocol' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:02:47'!
accept: anExpressionVisitor

	anExpressionVisitor visitTransferWithdrawLeg: self! !

!TransferWithdrawLeg methodsFor: 'main protocol' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'main protocol' stamp: 'TK 12/3/2021 16:16:19'!
accept: anExpressionVisitor

	anExpressionVisitor visitWithdraw: self! !

!Withdraw methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

!Withdraw methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Parte2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTree category: 'ServiciosFinancieros-Parte2'!
Object subclass: #PortfolioTree
	instanceVariableNames: 'portfolio tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTree methodsFor: 'main protocol' stamp: 'TK 12/5/2021 20:44:30'!
addChildAccounts

	portfolio withAccountsDo: [ :anAccount | anAccount accept: self ]! !

!PortfolioTree methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:44:10'!
compute
	
	(portfolio name = nil) ifTrue: [ ^ OrderedCollection new ].
	tree add: portfolio name.
	self addChildAccounts.
	
	^ tree! !

!PortfolioTree methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:50:13'!
visitPortfolio: aPortfolio
	aPortfolio portfolioTree do: [ :aChildPortfolioBranch | tree add: '    ', aChildPortfolioBranch]! !

!PortfolioTree methodsFor: 'main protocol' stamp: 'MW 12/4/2021 20:34:45'!
visitReceptiveAccount: anAccount
	tree add: '    ', anAccount name.! !


!PortfolioTree methodsFor: 'initialization' stamp: 'MW 12/4/2021 20:23:49'!
initializeWith: aPortfolio
	portfolio := aPortfolio.
	tree := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTree class' category: 'ServiciosFinancieros-Parte2'!
PortfolioTree class
	instanceVariableNames: ''!

!PortfolioTree class methodsFor: 'instance creation' stamp: 'MW 12/4/2021 20:23:17'!
of: aPortfolio
	^self new initializeWith: aPortfolio! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Parte2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
