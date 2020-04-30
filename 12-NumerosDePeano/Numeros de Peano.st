!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'base' stamp: 'DL 4/29/2020 21:00:06'!
> aNumber
	
	^false.! !

!I class methodsFor: 'base' stamp: 'DL 4/29/2020 21:14:47'!
greaterThan: aNumber

	^true.! !

!I class methodsFor: 'base' stamp: 'MF 4/28/2020 17:19:32'!
next

	^self createChildNamed: self name , 'I'.! !

!I class methodsFor: 'base' stamp: 'AM 4/27/2020 21:20:19'!
successor

	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operation' stamp: 'MF 4/28/2020 17:24:28'!
* aNumber 
	^aNumber.! !

!I class methodsFor: 'operation' stamp: 'AM 4/27/2020 21:38:28'!
+ aNumber 
	
	^aNumber successor! !

!I class methodsFor: 'operation' stamp: 'MF 4/29/2020 18:01:54'!
- aNumber 
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'operation' stamp: 'MF 4/30/2020 14:33:27'!
/ aNumber 

	aNumber > self
		ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]
		
		ifFalse: [^self calculateQuotient: aNumber].! !

!I class methodsFor: 'operation' stamp: 'MF 4/30/2020 14:27:34'!
calculateQuotient: aNumber 
	^self! !

!I class methodsFor: 'operation' stamp: 'MF 4/29/2020 17:53:11'!
substractFrom: aNumber 
	^aNumber previous ! !


!I class methodsFor: 'errors' stamp: 'DL 4/29/2020 19:38:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Cannot be divided by a larger number'! !

!I class methodsFor: 'errors' stamp: 'MF 4/28/2020 17:36:17'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Non positive numbers are not supported'.! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'base' stamp: 'DL 4/29/2020 21:18:29'!
greaterThan: aNumber

	^aNumber previous > self previous.! !

!II class methodsFor: 'base' stamp: 'AM 4/27/2020 21:42:53'!
previous

	^self parent! !


!II class methodsFor: 'operation' stamp: 'MF 4/28/2020 17:34:01'!
* aNumber 
	^aNumber + (self previous * aNumber).! !

!II class methodsFor: 'operation' stamp: 'AM 4/27/2020 21:48:54'!
+ aNumber 

	^self previous + aNumber successor! !

!II class methodsFor: 'operation' stamp: 'MF 4/29/2020 18:01:21'!
- aNumber 

	^aNumber substractFrom: self! !

!II class methodsFor: 'operation' stamp: 'DL 4/29/2020 21:19:51'!
> aNumber

	^aNumber greaterThan: self.! !

!II class methodsFor: 'operation' stamp: 'MF 4/30/2020 14:32:59'!
calculateQuotient: aNumber
	|remaining|

	self = aNumber
		ifTrue: [^I]
		ifFalse: [
				remaining := self - aNumber.		
				self > remaining
					ifTrue: [^(remaining/aNumber) successor]
					ifFalse: [^I].
			].! !

!II class methodsFor: 'operation' stamp: 'MF 4/29/2020 17:57:18'!
substractFrom: aNumber
	^aNumber previous - self previous! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #TestNumerosDePeano category: #'Numeros de Peano'!
DenotativeObject subclass: #TestNumerosDePeano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestNumerosDePeano class' category: #'Numeros de Peano'!
TestNumerosDePeano class
	instanceVariableNames: ''!

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:25:55'!
test01

	Assert that: I successor isEqualTo: II.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:28:06'!
test02ElSucesorDeUnNumeroNEsNAsterisco

	Assert that: II successor isEqualTo: III.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:33:59'!
test03UnoMasUnNumeroEsIgualAlSucesorDelNumero

	Assert that: I + III isEqualTo: III successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:35:40'!
test04

	Assert that: II + III isEqualTo: IIII successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:52:23'!
test05

	Assert that: II - I isEqualTo: I! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:55:03'!
test06

	Assert that: IIII - II isEqualTo: II! !
