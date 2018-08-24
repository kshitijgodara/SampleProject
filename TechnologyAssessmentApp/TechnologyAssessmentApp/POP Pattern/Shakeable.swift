//
//  Shakeable.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 24/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import UIKit

protocol Shakeable { }

// we can constrain the shake method to only UIViews!
extension Shakeable where Self: UIView {
    // default shake implementation
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
