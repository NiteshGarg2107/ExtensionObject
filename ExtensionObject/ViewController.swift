//
//  ViewController.swift
//  ExtensionObject
//
//  Created by User on 03/01/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn = UIButton()
        print(state(State: btn.State))
        btn.State = .on
        print(state(State: btn.State))
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
struct AssociatedKeys {
    static var toggleState: UInt8 = 0
}
enum TogleState {
    case on
    case off
}

extension UIButton {
    var State: TogleState {
        get {
            guard objc_getAssociatedObject(self, &AssociatedKeys.toggleState) != nil else {
                return .off
            }
            return objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as! TogleState
        }
        set(newvalue) {
            objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newvalue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}


