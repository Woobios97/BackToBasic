import UIKit

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


/// 여러 개의 케이스는 콤마로 구분이 가능하다.
enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/*
 각 열거형 정의는 새로운 타입으로 정의합니다.
 Swift의 다른 타입처럼 대문자로 시작하는 그들의 이름 (CompassPoint와 Planet)이 타입이다.
 열거형 타입에 복수 이름이 아닌 단수 이름으로 지정하여 읽기 쉽다.
 */
struct DirectionToHead {
  var direction : CompassPoint = CompassPoint.east
  /*
   directionToHead 타입은 CompasPoint 의 가능한 값 중 하나로 초기화 될 때 유추된다.
   directionToHead 는 CompassPoint 로 선언되고 더 짧게 점 구문을 사용하여 다른 CompassPoint 값을 설정할 수 있다.
   */
}
