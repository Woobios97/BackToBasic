import UIKit


/// 다음은 나침반의 4개의 주요 포인트를 나타낸다.
enum CompassPoint {
  case north
  case south
  case east
  case west
}

/*
 열거형 안에 정의된 값(north, south, east, west)은 열거형 케이스 (enumeration cases)이다. 새로운 열거형 케이스를 나타내기 위해 case 키워드를 사용한다.
 ❗️Note
 Swift 열거형 케이스는 C와 Object-C 처럼 기본적으로 정수값을 설정하지 않는다. 위 예제 CompassPoint에 north, south, east, west 는 0, 1, 2, 3과 같지 않다. 대신 다른 열거형 케이스는 CompassPoint 의 명시적으로 정의된 타입으로 자체 값이다.
 */

/// 여러 개의 케이스는 콤마로 구분하여 한줄로 표기할 수 있다.
enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/*
 각 열거형 정의는 새로운 타입으로 정의한다. Swift의 다른 타입처럼 대문자로 시작하는 그들의 이름(CompassPoint 와 Planet)이 타입이다. 열거형 타입에 복수 이름이 아닌 단수 이름으로 지정해야지 읽기 쉽다.
 */
var directionToHead = CompassPoint.west
/*
 directionToHead 타입은 CompassPoint 의 가능한 값 중 하나로 초기화될 때 유추된다. directionToHead 는 CompassPoint 로 선언되고 더 짧게 점 구문을 사용하여 다른 CompassPoint 값을 설정할 수 있다.
 */
directionToHead = .east
/*
 directionToHead 의 타입은 이미 알고 있으므로 값을 설정할 때 타입을 삭제할 수 있다. 따라서 명시적으로 타입화된 열거형 값으로 작업할 때 코드를 쉽게 읽을 수 있다.
 */

// ## 스위치 구문에서 열거형 값 일치 (Matching Enumeration Values with Switch Statement)
/// switch 구문으로 각각의 열거형 값을 일치시킬 수 있다.
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
/*
 이 코드를 아래와 같이 읽을 수 있습니다:
 "directionToHead 값을 고려합니다. .north 와 같은 케이스일 경우 "Lots of planets have a north" 를 출력합니다. .south 와 같은 케이스일 경우 "Watch out for penguins" 를 출력합니다."
*/

/*
 제어흐름(Control Flow) 에서 설명 했듯이 switch 구문은 열거형 케이스를 고려할 떄 완벽해야 한다.
 .west 에 대한 case 가 생략된다면 CompassPoint 케이스에 대해 모든 리스트가 고려되지 않았으므로 이 코드는 컴파일 되지 않는다. 완전성을 요구하면 열거형 케이스가 실수로 생략되지 않도록 한다.
 모든 열거형 케이스에 대해 case를 제공하는 것이 적절하지 않는 경우 명시적으로 해결되지 않은 사례를 포함하는 default 케이스를 제공할 수 있다.
*/
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// ## 열거형 케이스 반복 -> 열거형타입을 배열처럼 다루기
/*
 일부 열거형의 경우 열거형의 모든 케이스를 수집하는 것이 유용하다. 
 열거형 이름 뒤에 : CaseIterable 을 작성하여 활성화한다.
 Swift는 열거형 타입에 allCases 프로퍼티로 모든 케이스를 수집하고 방출한다.
 */
enum Beverage: CaseIterable {
  case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices)개의 음료들이 가능하다.")
/*
위의 예제에서 Beverage 열거형에 모든 케이스를 포함하는 컬렉션에 접근하기 위해 Beverage.allCases 를 작성한다.
다른 컬렉션처럼 allCases를 사용할 수 있다.
컬렉션의 요소는 열거형 타입의 인스턴스이기 때문에 이 경우에는 Beverage 값들이다. 위의 예제는 얼마나 많은 케이스가
존재하는 지 계산하고 아래의 예제에서는 for-in 루프를 사용하여 모든 케이스를 반복하다.
 */
for beverage in Beverage.allCases {
  print(beverage)
}

// ## 연관된 값(Associated Values)
/*
이전 섹션에서 예제는 열거형 케이스가 어떻게 정의되고 값이 입력되는 지 보여준다.
상수 또는 변수를 Planet.earth 로 설정하고 나중에 값을 체크할 수 있다. 그러나, 경우에 따라서 이러한 케이스 값과 함께 다른 타입의 값을 저장할 수 있는 것이 유용하다. 이 추가적인 정보를 연관된 값 (associated Value)라고 하며 해당 케이스를 코드에서 값으로 사용할 때마다 달라진다.
 주어진 타입의 연관된 값을 저장하기 위해 Swift 열거형을 정의할 수 있고 이 값 타입은 필요에 따라 열거형의 각 케이스에 따라 달라질 수 있다. 이와 유사한 열거형은 다른 프로그래밍 언어에서 식별된 집합체(dicriminated unions), 태그된 집합체(tagged unions) 또는 변형 가능한 집합체 (varient)로 알려져 있다.
*/

/*
예를 들어 재고 추적 시스템이 2가지 타입의 바코드로 제품을 추적해야 된다고 가정해 보겠다.
 어떤 제품은 숫자 0에서 9를 사용하는 UPC 형식의 1D 바코드 라벨이 부착되어 있다.
 각 바코드에는 숫자 시스템과 이어서 5자리의 제조업체 코드와 5자리의 제품 코드가 있다. 다음에는 코드가 올바르게 스캔되었는 지 확인하기 위해 검사 숫자가 있다.
 다른 제품은 어떠한 ISO 8859-1 문자도 사용할 수 있고 2,953개의 문자까지 인코딩할 수 있는 QR 코드 형식의 2D 바코드 라벨이 부착되어 있습니다:
 재고 추적 시스템은 UPC 바코드를 4개의 정수로 된 튜플로 저장하고 QR 코드 바코드를 모든 길이의 문자열로 저장하는 것이 편리합니다.

 Swift에서 두 타입의 바코드를 정의하는 열거형은 다음과 같습니다:
*/
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

/*
 이것은 아래와 같이 읽을 수 있습니다:
 "(Int, Int, Int, Int) 타입의 연관된 값을 가진 upc 또는 String 타입의 연관된 값을 가진 qrCode 를 취할 수 있는 Barcode 라는 열거형 타입을 정의합니다."
 이 정의는 어떠한 실질적인 Int 또는 String 값을 제공하지 않습니다. 
 이것은 단지 Barcode.upc 또는 Barcode.qrCode 와 같을 때 Barcode 상수와 변수에 저장할 수 있는 연관된 값의 타입 을 정의할 뿐입니다.

 그러면 이러한 타입을 이용하여 새로운 바코드를 생성할 수 있습니다:
*/
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
// 이 예제는 productBarcode 라 불리는 새로운 변수를 생성하고 연관된 튜플값인 (8, 85909, 51226, 3) 을 Barcode.upc 의 값으로 할당한다.
// 같은 상품의 다른 바코드 타입을 할당할 수 있다.
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
/*
 여기서 기존의 Barcode.upc 와 그것의 정수 값은 새로운 Barcode.qrCode 와 그것의 문자열 값으로 대체된다.
 Barcode 타입의 상수와 변수는 .upc 또는 .qrCode 모두 이것들과 연관된 값으로 저장할 수 있지만 오직 하나의 값만 저장할 수 있다.
 */

/*
 스위치 구문으로 열거형 값 일치 (Matching Enumeration Values with a Switch Statement) 에서의 예제와 유사하게 스위치 구문을 이용하여 다른 바코드 타입을 확인할 수 있습니다. 
 그러나 이번에는 관련값이 스위치 구문의 일부로 추출됩니다.
 switch 케이스의 본문 내에서 사용하기 위해 상수 (let 접두사) 또는 변수 (var 접두사)로 각 연관된 값을 추출합니다
 */
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."
let produceBarcodeTag: Barcode = .upc(4040, 02, 1022, 1022)
switch produceBarcodeTag {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode).")
}
// enum 은 어떠한 것에 이런이런 유형들을 있다고 정의해놓은 것. -> 제목
// switch 는 enum 에 정의된 유형들을 구체적으로 어떻게 할 것인지 정의해놓는 것. -> 내용

// 원시값(Raw Values)
/*
연관된 값(Associated Values) 에서의 바코드 에제는 어떻게 열거형 케이스에 다른 타입의 연관된 값을 저장한다고 선언하는 지를 보여준다.
 연관된 값의 대안으로 열거형 케이스는 모두 동일한 타입의 기본값(원시값(rawValues)) 로 미리 채워질 수 있다.
 다음은 명명된 열거형 케이스와 함께 ASCII 값을 저장하는 예이다.
*/
enum ASCIIControlCharacter: Character {
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}
/*
여기서는 ASCIIControlCharacter 라는 열거형의 원시값은 Character 타입으로 정의되고 일반적인 ASCII 제어 문자 중 일부를 선정합니다. Charcacter 값은 문자열과 문자(Strings and Character)에서 설명되어 있다.
 원시값은 문자열, 문자 또는 어떠한 정수 또는 부동소수점 숫자 타입이 가능하다. 각 원시값은 열거형 선언부 내에서 유일한 값이어야 한다.
 ❗️Note
 원시값은 연관된 값 (associated values)과 같지 않다. 원시값은 위의 3개의 ASCII 코드처럼 코드에서 열거형을 처음 정의할 때 미리 설정하는 값이다. 특정 열거형 케이스를 위한 원시값은 항상 같다.
 연관된 값은 열거형 케이스 중 하나를 기반으로 새로운 상수 또는 변수를 생성할 때 설정하고 달라질 수 있다.
*/

// ## 암시적으로 할당된 원시값
/*
 정수 또는 문자열 원시값이 저장된 열거형으로 동작시 각 케이스에 명시적으로 원시값을 가질 필요가 없다. 원시값을 설정하지 않으면 Swift는 자동적으로 값을 할당한다.
 예를 들어, 정수를 사용하면 각 케이스의 암시적 값은 이전 케이스보다 하나씩 증가시킨다. 첫번째 케이스에 값 설정이 안되어 있으면 0 으로 설정한다.
 아래의 열거형은 태양으로부터 각 행성의 순서를 정수값으로 나타내는 이전 Planet 열거형의 변형된 버전이다.
 */
enum Planet2: Int {
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/*
 위의 예제에서 Planet.mercury 는 명시적으로 원시값 1을 가지고 Planet.venus 는 암시적으로 원시값 2를 가진다.
 원시값으로 문자열이 사용될 때 각 케이스의 암시적 값은 케이스의 이름의 문자이다.
 아래의 열거형은 각 방향의 이름을 문자열 원시값으로 나타내는 이전 CompassPoint 열거형의 변형된 버전이다.
 */

enum CompassPoint2: String {
  case north, south, east, west
}
/*
위의 예제에서 CompassPoint.south 는 south 의 암시적 원시값을 가지고 있다.
 rawValue 프로퍼티를 사용하여 열거형 케이스의 원시값에 접근할 수 있다.
 */
let earthsOrder = Planet2.earth.rawValue
let sunsetDirection = CompassPoint2.west.rawValue

// ## 열거형 NameSpace
/*
 NameSpace 사용하는 이유 ❗️❗️
 네임스페이스는 연관된 값을 한 공간에 이름을 지어 모아둔 공간을 말한다.
 쉽게 예를 들면, 우리가 '서랍'에 물건을 보관할 때 , 그 안에 뭐가 들었는 지 '라벨링'하는 것과 비슷하다.
 유사한 물건들을 모아둠으로써, 관리(유지보수)가 쉬워지고 재사용도 편리해진다.
 네임스페이스를 통해서만 문자열에 접근할 수 있게 만드는 캡슐화(Encapsulation) 방법이기도 하다.
 코딩🧑🏻‍💻 을 할 때도 이런 네임스페이스를 잘 만들어두면, 하드 코딩도 방지하고 코드 가독성도 좋아진다.
 */
// 열거형에 인스턴스 연산 프로퍼티(Computed Property)를 사용하는 방법
enum CompassPoint3: String {
  case north
  case south
  case east
  case west

  var message: String {
    switch self {
    case .north:
      return "북쪽입니다."
    case .south:
      return "남쪽입니다."
    case .east:
      return "동쪽입니다."
    case .west:
      return "서쪽입니다."
    }
  }
}

// 🤔 NameSpace는 원시값과 연관이 있는 건가?
let nameSpaceEnum = CompassPoint3.east.message

/*
그러나 가능한 모든 Int 값으로 행성을 찾지는 않는다. 이러한 점 때문에 원시값 초기화는 항상 옵셔널 열거형 케이스를 반환한다.
 위의 예제에서 possiblePlanet 은 Planet? 또는 "옵셔널 Planet " 타입이다.

 ❗️ Note
 원시값 초기화는 모든 원시값을 열거형 케이스로 반환할 수 없으므로 초기화가 실패할 수 있다.
 */

// 11의 위치로 행성을 찾는다면 원시값 초기화로부터 반환된 옵셔널 Planet 값은 nil 이다.
let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
  switch somePlanet {
  case .earth:
       print("Mostly harmless")
   default:
       print("Not a safe place for humans")
   }
} else {
  print("There isn't a planet at position \(positionToFind)")
}

/*
 이 예제는 11의 원시값으로 행성을 찾기 위해 옵셔널 바인딩을 사용한다.
 if let somePlanet = Planet(rawValue: 11) 구문은 옵셔널 Planet 을 생성하고 가져올 수 있다면 옵셔널 Planet 의 값을 somePlanet 에 설정한다. 이 경우 11의 위치로 행성을 가져올 수 없으므로 대신에 else 구문이 실행된다.
 */

// ## 재귀 열거형
/*
 재귀 열거형(recursive enumeration)은 열거형 케이스에 하나 이상의 연관된 값으로 열거형의 다른 인스턴스를 가지고 있는 열거형이다. 열거형 케이스가 재귀적임을 나타내기 위해 케이스 자것ㅇ 전에 indirect을 작성하여 컴파일러에게 필요한 간접(indirection) 계층을 삽입하도록 지시한다.
 예를 들어 다음은 간단한 산술 표현식을 저장하는 열거형이다.
 */
enum ArithmeticExpression {
  case number(Int)
  indirect case addition(ArithmeticExpression, ArithmeticExpression)
  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
/*
 이 열거형은 숫자, 2개의 표현식의 덧셈, 2개의 표현식의 곱셈의 3가지의 산술 표현식을 저장할 수 있다. addtion 과 multiplication 케이스는 산술 표현식인 연관된 값을 가지고 있고 이 연관된 값은 중첩 표현식을 가능하게 해준다.
 예를 들어, (5 + 4) * 2 표현식은 곱셈의 우항은 하나의 숫자를 가지고 있고 좌항은 다른 표현식을 가지고 있다.
 데이터는 중첩되기 때문에 데이터를 저장하는 열거형도 중첩을 지원해야 한다. 이것은 열거형은 재귀적이어야 한다는 의미이다.
 아래의 코드는 (5 + 4) * 2 에 대해 생성되는 ArithmeticExpression 재귀 열거형을 나타냅니다:
 */
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

// 재귀 함수는 재귀 구조를 가진 데이터로 작업하는 간단한 방법입니다. 예를 들어 다음은 산술 표현식을 판단하는 함수입니다:
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// Prints "18"
