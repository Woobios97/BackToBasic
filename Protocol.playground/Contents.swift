import UIKit

/*
프로토콜
 - 지켜야 하는 규약
 - 자동차가 지키는 프로토콜
  - 바퀴가 있다. 창문이 있다.
  - 그렇기에 차를 만들때는 브레이크와 창문 열기 기능을 추가
 */
protocol Driveable {
  var speed: Int { get set }
  func speedDown () -> ()
}

