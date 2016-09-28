//
//  UIColorEx.swift
//  LiquidLoading
//
//  Created by Stefan DeClerck on 2015/08/21.
//  Copyright (c) 2016 Stefan DeClerck. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    var red: CGFloat {
        get {
            let components = CGColorGetComponents(self.CGColor)
            return components[0]
        }
    }
    
    var green: CGFloat {
        get {
            let components = CGColorGetComponents(self.CGColor)
            return components[1]
        }
    }
    
    var blue: CGFloat {
        get {
            let components = CGColorGetComponents(self.CGColor)
            return components[2]
        }
    }
    
    var alpha: CGFloat {
        get {
            return CGColorGetAlpha(self.CGColor)
        }
    }

    func alpha(alpha: CGFloat) -> UIColor {
        return UIColor(red: self.red, green: self.green, blue: self.blue, alpha: alpha)
    }
    
    func scale(scale: CGFloat) -> UIColor {
        return UIColor(red: self.red * scale, green: self.green * scale, blue: self.blue * scale, alpha: self.alpha)
    }
}
