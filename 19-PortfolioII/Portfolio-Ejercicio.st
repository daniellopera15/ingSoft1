!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:16:34'!
test20PortfolioCantAddSelf

	| portfolio |
	portfolio := Portfolio new.
	
	self assertTreeStructureBrokenWhen: portfolio adds: portfolio.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:16:51'!
test21PortfolioCantAddTwiceSameAccount

	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	portfolio add: account.
	
	self assertTreeStructureBrokenWhen: portfolio adds: account.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:17:14'!
test22PortfolioCantAddTwiceSamePortfolio

	| portfolio portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio add: portfolio2.
	
	self assertTreeStructureBrokenWhen: portfolio adds: portfolio2.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:17:35'!
test23PortfolioCantAddAccountAlreadyInChildPortfolio

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio2 add: account.
	portfolio add: portfolio2. 
	
	self assertTreeStructureBrokenWhen: portfolio adds: account.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:17:50'!
test24PortfolioCantAddAPortofolioWithAccountAlreadyAdded

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio add: account.
	portfolio2 add: account.
	
	self assertTreeStructureBrokenWhen: portfolio adds: portfolio2.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:18:04'!
test25PortfolioCantAddPortfolioWithAccountAlreadyAddedInChildPortfolio

	| portfolio portfolio2 portfolio3 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio2 add: account.
	portfolio3 add: account.
	portfolio add: portfolio2.
	
	self assertTreeStructureBrokenWhen: portfolio adds: portfolio3.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:18:24'!
test26ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInParent

	| portfolio portfolio2 portfolio3 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account := ReceptiveAccount new.
		
	portfolio add: portfolio2.
	portfolio add: account.
	portfolio3 add: account.
	
	self assertTreeStructureBrokenWhen: portfolio adds: portfolio3.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:18:45'!
test27ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInRoot

	| root portfolio2 portfolio3 account portfolio4 |
	root := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	account := ReceptiveAccount new.
		
	root add: portfolio2.
	portfolio2 add: portfolio4.
	root add: account.
	portfolio3 add: account.
	
	self assertTreeStructureBrokenWhen: portfolio4 adds: portfolio3.
! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 19:19:03'!
test28ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInAnyRoot

	| root portfolio2 portfolio3 account portfolio4 |
	root := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	account := ReceptiveAccount new.
		
	root add: portfolio4.
	portfolio2 add: portfolio4.
	portfolio2 add: account.
	portfolio3 add: account.
	
	self assertTreeStructureBrokenWhen: portfolio4 adds: portfolio3.
	! !


!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:42:05'!
test01EmptyPortfolioShouldHaveBalanceInCero

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:43:05'!
test02PortfolioWithEmptyAccountShouldHaveBalanceCero

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	portfolio add: account. 
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:46:53'!
test03PortfolioWithAccountShouldSameBalance

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	portfolio add: account. 
	
	self assert: 100 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:53:27'!
test04PortfolioWithManyAccountsBalanceShouldSumTheirBalance

	| portfolio account secondAccount thirdAccount |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	secondAccount  := ReceptiveAccount  new.
	Withdraw register: 50 on: secondAccount.

	thirdAccount := ReceptiveAccount new.
	Deposit register: 25 on: thirdAccount.
	 
	portfolio add: account.
	portfolio add: secondAccount.
	portfolio add: thirdAccount .
	
	self assert: 75 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:09:28'!
test12NestedPortofolioWithEmptyAccountShouldHaveBalanceCero

	| portfolio account portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	
	portfolio add: account.
	portfolio add: portfolio2.

	self assert: 0 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:13:36'!
test13NestedPortfolioWithAccountRootShouldHaveSumBalance

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio add: account.
	portfolio2 add: account2.
	portfolio add: portfolio2.

	self assert: 200 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:14:53'!
test14NestedPortfolioWithAccountChildShouldHaveOnlyOwnBalance

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio add: account.
	portfolio2 add: account2.
	portfolio add: portfolio2.

	self assert: 100 equals: portfolio2 balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:21:12'!
test15NestedManyPortfoliosWithAccountShouldSumAllBalances

	| portfolio portfolio2 account2  account3 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.

	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.

	account3 := ReceptiveAccount new.
	
	portfolio2 add: account2.
	portfolio3 add: account3.
	portfolio add: portfolio2.
	portfolio add: portfolio3.

	self assert: 100 equals: portfolio balance.
	! !


!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:55:05'!
test05EmptyPortfolioShoulNotHaveTransactions

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 	
	self deny: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:57:51'!
test06PortfolioWithAnAccountWithTransactionShouldHaveItRegistered

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:59:55'!
test07PortfolioShouldNotHaveRegisteredTransactionsNotInAccounts

	| portfolio account account2 transaction2 |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 200 on: account2.
	 
	portfolio add: account.
	
	self deny: (portfolio hasRegistered: transaction2).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:02:32'!
test08PortfolioHaveRegisteredATransactionInAnyHisAccounts

	| portfolio account account2 account3 transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	Withdraw  register: 100 on: account.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 50 on: account2.
	
	account3 := ReceptiveAccount  new.
	transaction := Deposit register: 50 on: account3.
	 
	portfolio add: account.
	portfolio add: account2.
	portfolio add: account3.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:03:15'!
test09EmptyPortfolioShouldNotHaveTransactions

	| portfolio |
	portfolio := Portfolio new.

	self assert: portfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:04:41'!
test10PortfolioWithAccountTransactionsShouldHaveTheAccountTransactions

	| portfolio account transaction|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 	
	
	portfolio add: account.

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:06:31'!
test11PortfolioWithManyAccountsShouldHaveAllTransactions

	| portfolio account transaction account2 transaction2 account3 transaction3|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 100 on: account. 
	
	account3 := ReceptiveAccount new.
	transaction3 := Deposit register: 100 on: account. 	
	
	portfolio add: account.
	portfolio add: account2.
	portfolio add: account3.

	self assert: (OrderedCollection with: transaction with: transaction2 with: transaction3) 
		equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:25:22'!
test16NestedPortfoliosShouldHaveRegisteredTransactionIfAnyChildHas

	| portfolio transaction account2 portfolio2 |
	portfolio := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio2 add: account2.
	portfolio add: portfolio2.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:27:41'!
test17DoubleNestedPortfoliosShouldHaveRegisteredTransactionIfAnyChildHas

	| portfolio transaction account2 portfolio2 portfolio3 portfolio4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3  := Portfolio  new.
	portfolio4 := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio4 add: account2.
	portfolio add: portfolio2.
	portfolio add: portfolio3.
	portfolio add: portfolio4.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:30:01'!
test18NestedPortfolioShouldHaveAllTransactions

	| portfolio account2 portfolio2 transaction |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account2.
	
	portfolio2 add: account2.
	portfolio add: portfolio2. 

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:31:55'!
test19ManyNestedPortfolioShouldHaveAllChildTransactions

	| portfolio account2 portfolio2 account3 account4 portfolio3 transaction2 transaction3 transaction4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 100 on: account2.
	account3 := ReceptiveAccount new.
	transaction3 := Withdraw register: 50 on: account3.
	account4 := ReceptiveAccount new.
	transaction4 := Deposit register: 25 on: account4.
	
	portfolio2 add: account2.
	portfolio3 add: account3.
	portfolio add: portfolio2.
	portfolio add: portfolio3.
	portfolio add: account4.

	self assert: (OrderedCollection with: transaction2 with: transaction3 with: transaction4) equals: portfolio transactions.
	! !


!PortfolioTest methodsFor: 'assertion' stamp: 'DL 6/21/2020 19:15:52'!
assertTreeStructureBrokenWhen: aPortfolio adds: aPortfolioEntry
	
	self should: [aPortfolio add: aPortfolioEntry]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/18/2020 17:33:13'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #ReportTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReportTest methodsFor: 'transfer net' stamp: 'MF 6/27/2020 19:12:46'!
test08emptyAccountNetReportShouldBeZero
	
	| account |

	account := ReceptiveAccount new.
	
	self assertTransferNetReportFor: account isEqualTo: 0.! !

!ReportTest methodsFor: 'transfer net' stamp: 'MF 6/27/2020 19:13:19'!
test09accountTransferNetReportShouldTakeIntoAccountTransfers
	
	| account account2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 20 on: account. 
	Transfer register: 20 from: account to: account2. 
		
	self assertTransferNetReportFor: account isEqualTo: -20.
	self assertTransferNetReportFor: account2 isEqualTo: 20.		! !

!ReportTest methodsFor: 'transfer net' stamp: 'MF 6/27/2020 19:14:36'!
test10accountTransferNetReportShouldWorkWithManyTransfers
	
	| account account2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 20 on: account. 
	Transfer register: 20 from: account to: account2.
	Transfer register: 10 from: account2 to: account.
	
	self assertTransferNetReportFor: account isEqualTo: -10. 
	self assertTransferNetReportFor: account2 isEqualTo: 10.! !

!ReportTest methodsFor: 'transfer net' stamp: 'MF 6/27/2020 19:15:24'!
test11emptyPortfolioTransferNetReportShouldBeZero
	
	| portfolio |
	
	portfolio := Portfolio new.
	self assertTransferNetReportFor: portfolio isEqualTo: 0. ! !

!ReportTest methodsFor: 'transfer net' stamp: 'MF 6/27/2020 19:16:27'!
test12portfolioTransferNetReportShouldWorkWithManyAccountsAndTransactions
	
	| account account2 portfolio |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 20 on: account. 
	Transfer register: 20 from: account to: account2. 
	Withdraw register: 10 on: account2.
	
	portfolio := Portfolio new.
	portfolio add: account.
	portfolio add: account2. 
	
	self assertTransferNetReportFor: portfolio isEqualTo: 0! !


!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 18:52:56'!
assertSummaryReportFor: anAccount isEqualTo: aStringArrayReport
	self assert: (OrderedCollection withAll: aStringArrayReport) 
		equals: (self report: SummaryReport for: anAccount).! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 18:55:26'!
assertTransferNetReportFor: anAccount isEqualTo: aTransferNetValue
	self assert: aTransferNetValue equals: (self report: TransferNetReport for: anAccount).! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 18:48:21'!
report: aReportClass for: anAccount
	^(aReportClass account: anAccount) report.! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 18:56:47'!
test01emptyAccountSummaryShouldOnlyHaveZeroBalance
	
	| account |

	account := ReceptiveAccount new.
	self assertSummaryReportFor: account isEqualTo: #('Balance = 0').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 18:59:44'!
test02accountSummaryShouldTakeIntoAccountWithdrawals
	
	| account |

	account := ReceptiveAccount new.
	Withdraw register: 50 on: account.
		
	self assertSummaryReportFor: account isEqualTo: #('Extracción por 50.' 'Balance = -50').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 19:00:45'!
test03accountSummaryShouldTakeIntoAccountDeposits
	
	| account |

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
		
	self assertSummaryReportFor: account isEqualTo: #('Depósito por 100.' 'Balance = 100').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 19:03:32'!
test04accountSummaryShouldWorkWithManyDepositsAndWithdrawals
	
	| account |

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	Deposit register: 25 on: account.
	Withdraw register: 5 on: account.
		
	self assertSummaryReportFor: account 
	isEqualTo: #(
			'Depósito por 100.' 
			'Extracción por 50.' 
			'Depósito por 25.' 
			'Extracción por 5.' 
			'Balance = 70').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 19:08:27'!
test05accountSummaryShouldTakeIntoAccountTransfers
	
	| account account2 |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 20 on: account. 
	Transfer register: 20 from: account to: account2. 
		
	self assertSummaryReportFor: account isEqualTo: #('Depósito por 20.' 'Salida por transferencia de 20.' 'Balance = 0').
	self assertSummaryReportFor: account2 isEqualTo: #('Entrada por transferencia de 20.' 'Balance = 20').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 19:09:25'!
test06emptyPortfolioSummaryShouldOnlyHaveZeroBalance
	
	| portfolio |
	
	portfolio := Portfolio new.
		
	self assertSummaryReportFor: portfolio isEqualTo: #('Balance = 0').! !

!ReportTest methodsFor: 'summary' stamp: 'MF 6/27/2020 19:10:53'!
test07portfolioSummaryShouldWorkWithManyAccountsAndTransactions
	
	| account account2 portfolio |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 20 on: account. 
	Transfer register: 20 from: account to: account2. 
	Withdraw register: 10 on: account2.
	
	portfolio := Portfolio new.
	portfolio add: account.
	portfolio add: account2. 
	
	self assertSummaryReportFor: portfolio 
	isEqualTo: #(
		'Depósito por 20.' 
		'Salida por transferencia de 20.' 
		'Entrada por transferencia de 20.'
		'Extracción por 10.' 
		'Balance = 10').! !


!classDefinition: #TransferTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'MF 6/27/2020 19:19:34'!
test01transferBetweenAccountsShouldWork

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 1000 on: account1 .
	
	account2 := ReceptiveAccount new.
	
	Transfer register: 1000 from: account1 to: account2.
	
	self assert: 0 equals: account1 balance.
	self assert: 1000 equals: account2 balance.
! !

!TransferTest methodsFor: 'tests' stamp: 'MF 6/27/2020 19:21:02'!
test02shouldNotBeAbleToTransferToSelf

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 1000 on: account. 
	
	self should: [Transfer register: 1000 from: account to: account.] raise: Error withMessageText: Transfer transferToSameAccountErrorDescription
! !

!TransferTest methodsFor: 'tests' stamp: 'MF 6/27/2020 19:25:10'!
test03mustTransferAPositiveAmount

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 1000 on: account1. 
	
	account2 := ReceptiveAccount new.
	
	self should: [Transfer register: 0 from: account1 to: account2.] 
	raise: Error withMessageText: Transfer transferNonPositiveErrorDescription.
! !

!TransferTest methodsFor: 'tests' stamp: 'MF 6/27/2020 19:27:43'!
test04flowBetweenTransferLegsShouldWork

	| account1 account2 inTransfer outTransfer transfer |
	
	account1 := ReceptiveAccount new.
	Deposit register: 1000 on: account1. 
	
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 1000 from: account1 to: account2.
	inTransfer := transfer inTransfer.
	outTransfer := transfer outTransfer.
	
	self assert: transfer equals: inTransfer transfer. 
	self assert: transfer equals: outTransfer transfer. 
	self assert: outTransfer equals: inTransfer transfer outTransfer. 
	self assert: inTransfer equals: outTransfer transfer inTransfer. ! !

!TransferTest methodsFor: 'tests' stamp: 'MF 6/27/2020 19:28:49'!
test05accountsShouldRegisterTransactionLegs

	| account1 account2 transaction |
	
	account1 := ReceptiveAccount new.
	Deposit register: 1000 on: account1 .
	
	account2 := ReceptiveAccount new.
	
	transaction := Transfer register: 1000 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transaction outTransfer).
	self assert: (account2 hasRegistered: transaction inTransfer).
! !


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Account methodsFor: 'testing' stamp: 'DL 6/21/2020 18:31:45'!
hasRegistered
	
	^self subclassResponsibility! !


!Account methodsFor: 'balance' stamp: 'DL 6/21/2020 18:31:17'!
balance
	
	^self subclassResponsibility! !


!Account methodsFor: 'transactions' stamp: 'DL 6/21/2020 18:32:00'!
transactions
	
	^self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'MF 6/22/2020 19:36:13'!
addTo: aPortfolio
	
	^self subclassResponsibility! !

!Account methodsFor: 'private' stamp: 'DL 6/21/2020 18:42:07'!
hasAccountInCommonWith: aPortfolioEntry
	
	^self subclassResponsibility! !

!Account methodsFor: 'private' stamp: 'DL 6/21/2020 18:32:15'!
isReachable: aPortfolioEntry
	
	^self subclassResponsibility! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'entries parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'MF 6/20/2020 18:05:21'!
balance
	^(entries sum: [:account | account balance] ifEmpty: [0])! !


!Portfolio methodsFor: 'testing' stamp: 'MF 6/20/2020 18:05:36'!
hasRegistered: aTransaction
	^(entries anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]).! !


!Portfolio methodsFor: 'transactions' stamp: 'DL 6/21/2020 19:20:22'!
transactions
	^(entries inject: OrderedCollection new into: [:acc :account | acc , account transactions])

! !


!Portfolio methodsFor: 'signals' stamp: 'MF 6/20/2020 18:15:17'!
signalTreeStructureBroken

	^ self error: self class cantBreakTreeStructureErrorDescription! !


!Portfolio methodsFor: 'initialization' stamp: 'MF 6/20/2020 20:15:18'!
initialize
	entries := OrderedCollection new.
	parents := OrderedCollection new.
! !


!Portfolio methodsFor: 'adding' stamp: 'MF 6/22/2020 19:36:13'!
add: aPortfolioEntry 
	
	self validateTreeStructureNotBrokenWhenAdding: aPortfolioEntry.
	
	entries add: aPortfolioEntry.
	
	"Se dejo este if. Pensamos que si aplicabamos el algoritmo para sacar ifs, y colocábamos el addOwner en PortfolioEntry y ReceptiveAccount no hiciera nada, podía hacer confusa la escencia de ese objeto."
	
	(aPortfolioEntry isKindOf: self class) ifTrue: [ aPortfolioEntry addTo: self ].! !


!Portfolio methodsFor: 'private' stamp: 'MF 6/22/2020 19:36:13'!
addTo: aPortfolio 
	parents add: aPortfolio.! !

!Portfolio methodsFor: 'private' stamp: 'MF 6/20/2020 19:28:38'!
hasAccountInCommonWith: aPortfolioEntry
	^(aPortfolioEntry isReachable: self) or: [entries anySatisfy: [:entry | entry hasAccountInCommonWith: aPortfolioEntry]]! !

!Portfolio methodsFor: 'private' stamp: 'MF 6/20/2020 21:04:23'!
hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry 
	
	self isRootPortfolio ifTrue: [^self hasAccountInCommonWith: aPortfolioEntry].
	^parents anySatisfy: [:parent | (parent hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry)].
	! !

!Portfolio methodsFor: 'private' stamp: 'MF 6/20/2020 18:37:55'!
isReachable: aPortfolioEntry
	^(aPortfolioEntry = self) or: [entries anySatisfy: [:entry | entry isReachable: aPortfolioEntry]]! !

!Portfolio methodsFor: 'private' stamp: 'MF 6/20/2020 21:04:23'!
isRootPortfolio

	^ parents isEmpty! !

!Portfolio methodsFor: 'private' stamp: 'DL 6/21/2020 19:07:19'!
validateTreeStructureNotBrokenWhenAdding: aPortfolioEntry

	^ (self hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry) ifTrue: [self signalTreeStructureBroken]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'MF 6/20/2020 18:13:02'!
cantBreakTreeStructureErrorDescription
	^'cannot create cyclic references to accounts nor Portfolios'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DL 6/21/2020 18:53:36'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'DL 6/21/2020 18:23:58'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | aTransaction applyToBalance: balance]. ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'private' stamp: 'MF 6/20/2020 19:29:05'!
hasAccountInCommonWith: aPortfolioEntry
	^aPortfolioEntry isReachable: self! !

!ReceptiveAccount methodsFor: 'private' stamp: 'MF 6/20/2020 18:38:56'!
isReachable: aPortfolioEntry
	^aPortfolioEntry = self! !


!ReceptiveAccount methodsFor: 'adding' stamp: 'MF 6/22/2020 19:36:13'!
addTo: aPortfolio! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:20:34'!
applyToBalance: balance

	^self subclassResponsibility.! !

!AccountTransaction methodsFor: 'balance operation' stamp: 'DL 6/25/2020 21:38:46'!
transferNetReport

 	^self subclassResponsibility.! !


!AccountTransaction methodsFor: 'report' stamp: 'MF 6/27/2020 18:15:58'!
reportTo: aReport 
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'DL 6/25/2020 20:35:23'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'DL 6/21/2020 18:19:48'!
value

	^ value! !


!Deposit methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:21:58'!
applyToBalance: balance

	^ balance + self value.! !


!Deposit methodsFor: 'report' stamp: 'MF 6/27/2020 18:21:06'!
reportTo: aReport

	^aReport reportForDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferLeg methodsFor: 'value' stamp: 'DL 6/25/2020 20:34:48'!
value

	^transfer value.! !


!TransferLeg methodsFor: 'transfer' stamp: 'DL 6/25/2020 20:29:01'!
transfer

	^transfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'Portfolio-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'DL 6/25/2020 20:30:17'!
for: aTransfer 

	^self new initializeWith: aTransfer.! !


!classDefinition: #InTransfer category: #'Portfolio-Ejercicio'!
TransferLeg subclass: #InTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!InTransfer methodsFor: 'initialization' stamp: 'DL 6/22/2020 21:27:47'!
initializeWith: aTransfer 
	
	transfer := aTransfer.! !


!InTransfer methodsFor: 'report' stamp: 'MF 6/27/2020 18:21:24'!
reportTo: aReport 
	^aReport  reportForInTransfer: self.! !


!InTransfer methodsFor: 'balance operation' stamp: 'DL 6/22/2020 21:33:54'!
applyToBalance: balance 
	
	^balance + self value.! !


!classDefinition: #OutTransfer category: #'Portfolio-Ejercicio'!
TransferLeg subclass: #OutTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!OutTransfer methodsFor: 'initialization' stamp: 'DL 6/22/2020 21:26:16'!
initializeWith: aTransfer 

	transfer := aTransfer.! !


!OutTransfer methodsFor: 'balance operation' stamp: 'DL 6/22/2020 21:34:18'!
applyToBalance: balance

	^balance - self value.! !


!OutTransfer methodsFor: 'report' stamp: 'MF 6/27/2020 18:21:41'!
reportTo: aReport 
	^aReport  reportForOutTransfer: self.! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:22:11'!
applyToBalance: balance

	^ balance - self value.! !


!Withdraw methodsFor: 'report' stamp: 'MF 6/27/2020 18:21:50'!
reportTo: aReport 
	^aReport reportForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioEntry category: #'Portfolio-Ejercicio'!
Object subclass: #PortfolioEntry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioEntry methodsFor: 'testing' stamp: 'DL 6/21/2020 18:31:45'!
hasRegistered
	
	^self subclassResponsibility! !


!PortfolioEntry methodsFor: 'balance' stamp: 'DL 6/21/2020 18:31:17'!
balance
	
	^self subclassResponsibility! !


!PortfolioEntry methodsFor: 'transactions' stamp: 'DL 6/21/2020 18:32:00'!
transactions
	
	^self subclassResponsibility! !


!PortfolioEntry methodsFor: 'private' stamp: 'MF 6/22/2020 19:36:13'!
addTo: aPortfolio
	
	^self subclassResponsibility! !

!PortfolioEntry methodsFor: 'private' stamp: 'DL 6/21/2020 18:42:07'!
hasAccountInCommonWith: aPortfolioEntry
	
	^self subclassResponsibility! !

!PortfolioEntry methodsFor: 'private' stamp: 'DL 6/21/2020 18:32:15'!
isReachable: aPortfolioEntry
	
	^self subclassResponsibility! !


!classDefinition: #Report category: #'Portfolio-Ejercicio'!
Object subclass: #Report
	instanceVariableNames: 'account transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Report methodsFor: 'private' stamp: 'MF 6/27/2020 18:33:45'!
getTransactionsReport
	^self subclassResponsibility! !


!Report methodsFor: 'initialization' stamp: 'MF 6/27/2020 18:25:42'!
initializeWithAccount: anAccount

	account := anAccount.
	transactions := anAccount transactions.! !


!Report methodsFor: 'report for' stamp: 'MF 6/27/2020 18:34:08'!
reportForDeposit: aDeposit 
	^self subclassResponsibility
! !

!Report methodsFor: 'report for' stamp: 'MF 6/27/2020 18:35:04'!
reportForInTransfer: anInTransfer 
	^self subclassResponsibility
! !

!Report methodsFor: 'report for' stamp: 'MF 6/27/2020 18:35:11'!
reportForOutTransfer: anOutTransfer 
	^self subclassResponsibility
! !

!Report methodsFor: 'report for' stamp: 'MF 6/27/2020 18:34:51'!
reportForWithdraw: aWithdraw 
	^self subclassResponsibility
! !


!Report methodsFor: 'evaluating' stamp: 'MF 6/27/2020 18:26:27'!
report
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: #'Portfolio-Ejercicio'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'MF 6/27/2020 19:35:45'!
account: anAccount
	^self new initializeWithAccount: anAccount! !


!classDefinition: #SummaryReport category: #'Portfolio-Ejercicio'!
Report subclass: #SummaryReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!SummaryReport methodsFor: 'evaluating' stamp: 'MF 6/27/2020 18:27:00'!
report

	| summary |
	
	summary := self getTransactionsReport.
	summary add: ('Balance = ', account balance asString).
	
	^summary ! !


!SummaryReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:16:58'!
reportForDeposit: aDeposit 
	^'Depósito por ', aDeposit value asString, '.'! !

!SummaryReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:17:11'!
reportForInTransfer: anInTransfer 
	^'Entrada por transferencia de ', anInTransfer value asString, '.'
	! !

!SummaryReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:17:25'!
reportForOutTransfer: anOutTransfer 
	^'Salida por transferencia de ', anOutTransfer value asString, '.'
	! !

!SummaryReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:17:36'!
reportForWithdraw: aWithdraw 
	^'Extracción por ', aWithdraw value asString, '.'.! !


!SummaryReport methodsFor: 'private' stamp: 'MF 6/27/2020 18:30:37'!
getTransactionsReport
	^ transactions collect: [:transaction | transaction reportTo: self]! !


!classDefinition: #TransferNetReport category: #'Portfolio-Ejercicio'!
Report subclass: #TransferNetReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!TransferNetReport methodsFor: 'private' stamp: 'MF 6/27/2020 18:31:19'!
getTransactionsReport
	^transactions sum: [ :transaction | transaction reportTo: self] ifEmpty: [0].! !


!TransferNetReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:19:36'!
reportForDeposit: aDeposit 
	^0.! !

!TransferNetReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:20:01'!
reportForInTransfer: anInTransfer 
	^anInTransfer value.
! !

!TransferNetReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:20:11'!
reportForOutTransfer: anOutTransfer 
	^anOutTransfer value negated.
! !

!TransferNetReport methodsFor: 'report for' stamp: 'MF 6/27/2020 18:19:49'!
reportForWithdraw: aWithdraw
	^0. 
! !


!TransferNetReport methodsFor: 'evaluating' stamp: 'MF 6/27/2020 18:31:33'!
report
	^self getTransactionsReport.
! !


!classDefinition: #Transfer category: #'Portfolio-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount inTransfer outTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'MF 6/25/2020 16:28:55'!
initializeWith: value 

	amount := value.! !

!Transfer methodsFor: 'initialization' stamp: 'DL 6/22/2020 20:37:37'!
initializeWith: senderAccount with: recipientAccount with: value 

	sender := senderAccount.
	recipient := recipientAccount.
	amount := value.! !

!Transfer methodsFor: 'initialization' stamp: 'DL 6/22/2020 21:33:17'!
value

	^amount.! !


!Transfer methodsFor: 'out transfer' stamp: 'MF 6/25/2020 16:24:10'!
outTransfer
	^outTransfer! !

!Transfer methodsFor: 'out transfer' stamp: 'MF 6/25/2020 16:29:31'!
outTransfer: anOutTransfer 
	outTransfer _ anOutTransfer! !


!Transfer methodsFor: 'in transfer' stamp: 'MF 6/25/2020 16:23:31'!
inTransfer
	^inTransfer! !

!Transfer methodsFor: 'in transfer' stamp: 'MF 6/25/2020 16:29:41'!
inTransfer: anInTransfer 
	inTransfer _ anInTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error descriptions' stamp: 'DL 6/22/2020 20:13:02'!
notEnoughFundsErrorDescription

	^'Not Enough funds available.'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'MF 6/27/2020 19:24:47'!
transferNonPositiveErrorDescription
	
	^'Cannot transfer negative balance'.! !

!Transfer class methodsFor: 'error descriptions' stamp: 'DL 6/22/2020 20:01:50'!
transferToSameAccountErrorDescription

	^'Cannot transfer to same account'.! !


!Transfer class methodsFor: 'instance creation' stamp: 'MF 6/27/2020 19:24:47'!
register: value from: senderAccount to: recipientAccount

	| transfer inTransfer outTransfer |
	senderAccount = recipientAccount  ifTrue: [self error: self transferToSameAccountErrorDescription].
	value <= 0 ifTrue: [self error: self transferNonPositiveErrorDescription].
	
	transfer := self new initializeWith: value.
	
	outTransfer := OutTransfer register: transfer on: senderAccount.
	inTransfer := InTransfer register: transfer on: recipientAccount.
	
	transfer outTransfer: outTransfer.
	transfer inTransfer: inTransfer.
	
	^transfer.! !
