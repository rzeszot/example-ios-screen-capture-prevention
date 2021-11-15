import UIKit

extension UIView {
  var isSecuredCapture: Bool {
    get {
      layer.disableUpdateMask == 0x12
    }
    set {
      layer.disableUpdateMask = newValue ? 0x12 : 0
    }
  }
}

fileprivate extension CALayer {
  var disableUpdateMask: Int {
    get {
      value(forKey: "disableUpdateMask") as! Int
    }
    set(value) {
      setValue(value, forKey: "disableUpdateMask")
    }
  }
}
