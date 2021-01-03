//
//  UIColor.Extension.swift
//  MyChat
//
//  Created by 濱貴大 on 2020/10/25.
//

import UIKit

extension UIColor{
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return self.init(red: red / 250, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
