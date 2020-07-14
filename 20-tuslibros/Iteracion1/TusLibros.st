!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:57:50'!
setUp

	catalogue := Set with: 1 with: 2 with: 3.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:58:22'!
test01

	| cart |
	cart := Cart withCatalogue: catalogue.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:59:30'!
test02

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 1.
	
	cart add: book.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:59:39'!
test03

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 1.
	
	cart add: book.
	
	self assert: (cart includes: book).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:59:46'!
test04

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 1.
	
	cart add: 3 of: book.
	
	self assert: (cart includes: 3 of: book).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:59:52'!
test05

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 1.
	
	cart add: 3 of: book.
	
	self deny: (cart includes: 2 of: book).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 19:00:08'!
test06

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 4.
	
	self should: [cart add: book] raise: Error withMessageText: Cart cantAddBookNotFromPublisherErrorDescription! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 19:01:00'!
test07

	| cart book |
	
	cart := Cart withCatalogue: catalogue.
	
	book := 4.
	
	self should: [cart add: 3 of: book] raise: Error withMessageText: Cart cantAddBookNotFromPublisherErrorDescription! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items bookCatalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:38:19'!
add: item

	self add: 1 of: item.

	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:51:15'!
add: quantity of: item

	(bookCatalogue includes: item) ifFalse: [self error: self class cantAddBookNotFromPublisherErrorDescription].

	items add: item withOccurrences: quantity.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:31:59'!
includes: item 

	^items includes: item.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:42:57'!
includes: aQuantity of: book

	^(items occurrencesOf: book) = aQuantity.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:54:47'!
initializeWith: aCatalogue

	items := Bag new.
	bookCatalogue := aCatalogue.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:27:18'!
isEmpty

	^items isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:51:15'!
cantAddBookNotFromPublisherErrorDescription

	^'Cannot add a book from other publisher'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'DL 7/5/2020 18:59:12'!
withCatalogue: aSet 

	^self new initializeWith: aSet.! !
