!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:09:30'!
* aMultiplier
	
	^aMultiplier multiplyAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 11:04:08'!
+ anAdder
	
	^ anAdder beAddedToAnEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MW 10/22/2021 11:50:54'!
- aSubtrahend 

	^ aSubtrahend beSubstractedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:05:37'!
/ aDivisor 
	
	^aDivisor divideAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:23:10'!
fibonacci

	self subclassResponsibility 
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 09:52:40'!
beAddedToAFraccion: anAugend
	
	^ anAugend denominator divideAnEntero: (anAugend numerator beAddedToAnEntero: anAugend denominator)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/22/2021 10:34:32'!
beAddedToAnEntero: anAugend

	^ Entero with: anAugend integerValue + self integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 09:54:30'!
beSubstractedToAFraccion: aMinuend

	^ aMinuend denominator divideAnEntero: (aMinuend denominator beSubstractedToAnEntero: aMinuend numerator).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'MW 10/22/2021 11:56:14'!
beSubstractedToAnEntero: aMinuend
	^ Entero with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 10:04:28'!
divideAFraccion: aDividend
	
	| newDenominator |
	
	newDenominator := aDividend denominator multiplyAnEntero: self.
	^ newDenominator divideAnEntero: aDividend numerator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/22/2021 15:05:37'!
divideAnEntero: aDividend

	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 10:01:37'!
multiplyAFraccion: aMultiplicand

	^ aMultiplicand denominator divideAnEntero: (aMultiplicand numerator multiplyAnEntero: self)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'TK 10/22/2021 15:09:30'!
multiplyAnEntero: aMultiplicand

	^Entero with: aMultiplicand integerValue * self integerValue.! !


!Entero methodsFor: 'instance creation' stamp: 'MW 10/25/2021 15:00:30'!
beDividendWithDivisor: aDivisor
	| greatestCommonDivisor numerator denominator|
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !

!Entero methodsFor: 'instance creation' stamp: 'TK 10/25/2021 11:17:33'!
beDivisorWithDividend: aDividend

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'TK 10/25/2021 11:35:56'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"Se nos complico reemplazar estos ifs por polimorfismo"
	(aValue isZero) ifTrue: [		^ Zero new initalizeWith: aValue 	].
	(aValue = 1) ifTrue: [ ^ One new initalizeWith: aValue ].
	(aValue < 0) ifTrue: [		^ NegativeEntero new initalizeWith: aValue ].	
	^ EnteroGreaterThanOne new initalizeWith: aValue! !


!classDefinition: #EnteroGreaterThanOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroGreaterThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroGreaterThanOne methodsFor: 'arithmetic operations' stamp: 'TK 10/25/2021 11:27:30'!
fibonacci

	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	^ (two beSubstractedToAnEntero: self) fibonacci beAddedToAnEntero: (one beSubstractedToAnEntero: self) fibonacci! !


!EnteroGreaterThanOne methodsFor: 'instance creation' stamp: 'MW 10/25/2021 15:01:56'!
beDivisorWithDividend: aDividend

	^aDividend beDividendWithDivisor: self.! !


!classDefinition: #NegativeEntero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #NegativeEntero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NegativeEntero methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:14:31'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!NegativeEntero methodsFor: 'instance creation' stamp: 'MW 10/23/2021 11:58:38'!
beDivisorWithDividend: aDividend
	^aDividend negated / self negated! !


!classDefinition: #NeutralEntero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #NeutralEntero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NeutralEntero methodsFor: 'arithmetic operations' stamp: 'TK 10/25/2021 09:38:36'!
fibonacci

	^ Entero with: 1! !


!classDefinition: #One category: 'Numeros-Parte2-Ejercicio'!
NeutralEntero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!One methodsFor: 'instance creation' stamp: 'MW 10/25/2021 15:02:26'!
beDivisorWithDividend: aDividend

	^aDividend beDividendWithDivisor: self.! !


!classDefinition: #Zero category: 'Numeros-Parte2-Ejercicio'!
NeutralEntero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Zero methodsFor: 'instance creation' stamp: 'MW 10/25/2021 15:00:56'!
beDividendWithDivisor: aDivisor

	^self.! !

!Zero methodsFor: 'instance creation' stamp: 'MW 10/23/2021 12:15:43'!
beDivisorWithDividend: aDividend
	^self error: self class canNotDivideByZeroErrorDescription! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:09:10'!
* aMultiplier

	^aMultiplier multiplyAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MW 10/22/2021 11:37:39'!
+ anAdder 
	^anAdder beAddedToAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MW 10/22/2021 12:03:26'!
- aSubtrahend 
	
	^aSubtrahend beSubstractedToAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TK 10/22/2021 15:05:25'!
/ aDivisor 

	^aDivisor divideAFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 10:13:06'!
beAddedToAFraccion: anAugend
	|newNumerator newDenominator|
	
	newNumerator := (anAugend numerator multiplyAnEntero: self denominator) beAddedToAnEntero: (anAugend denominator multiplyAnEntero: self numerator).
	newDenominator := anAugend denominator multiplyAnEntero: self denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 15:59:59'!
beAddedToAnEntero: anAugend

	^ self denominator divideAnEntero: (anAugend multiplyAnEntero: (self denominator beAddedToAnEntero: self numerator)).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 10:12:32'!
beSubstractedToAFraccion: aMinuend

	| newNumerator newDenominator |

	newNumerator := (self numerator multiplyAnEntero: aMinuend denominator) beSubstractedToAnEntero: (self denominator multiplyAnEntero: aMinuend numerator).
	newDenominator := self denominator multiplyAnEntero: aMinuend denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 16:06:50'!
beSubstractedToAnEntero: aMinuend

	^ aMinuend * self denominator - self numerator / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 10:15:27'!
divideAFraccion: aDividend

	^ (self numerator multiplyAnEntero: aDividend denominator) divideAnEntero: (self denominator multiplyAnEntero: aDividend numerator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 16:08:21'!
divideAnEntero: aDividend

	 | newDenominator newNumerator |
	
	newDenominator := self numerator.
	newNumerator := self denominator.
	^ (Fraccion with: (newNumerator multiplyAnEntero: aDividend) over: newDenominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/25/2021 11:10:24'!
multiplyAFraccion: aMultiplier

	^ (aMultiplier denominator * self denominator) divideAnEntero: (self numerator multiplyAnEntero: aMultiplier numerator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'TK 10/22/2021 15:09:30'!
multiplyAnEntero: aMutiplier

	^ aMutiplier * self numerator / self denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'MW 10/23/2021 12:16:35'!
with: aDividend over: aDivisor

	^aDivisor beDivisorWithDividend: aDividend.! !
