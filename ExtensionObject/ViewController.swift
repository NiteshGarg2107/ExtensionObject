//
//  ViewController.swift
//  ExtensionObject
//
//  Created by User on 03/01/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
struct AssociatedKeys {
    static var toggleState: UInt8 = 0
}
enum TogleState {
    case on
    case off
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn = UIButton()
//        state(State: btn.State)
        btn.State = .on
        state(State: btn.State)
    }
    func state(State: TogleState) -> Void {
        switch State {
        case .off:
            print("offState")
        case .on:
            print("onState")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIButton {
    var State: TogleState {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as? TogleState else {
                return .off
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

/*
OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
 *   The association is not made atomically. */
OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
 *   The association is not made atomically. */
OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
 *   The association is made atomically. */
OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
 *   The association is made atomically. */
};
*/
