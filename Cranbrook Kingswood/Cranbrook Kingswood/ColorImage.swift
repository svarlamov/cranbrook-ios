//
//  ColorImage.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/9/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

class Color {
    class func imageWithColor(color: UIColor, size: CGSize = CGSizeMake(60, 60)) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image;
    }
}