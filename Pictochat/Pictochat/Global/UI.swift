//
//  UI.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-13.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import Foundation
import UIKit

struct UI {
    struct Colors {
        static let white = UIColor.white
        static let black = UIColor.black
        static let green = UIColor(hexValue: 0x76C61A)
        static let red = UIColor(hexValue: 0xFF3B30)
        static let grey = UIColor(hexValue: 0x8E8E93)
        static let blue = UIColor(hexValue: 0x4A90E2)
    }
    
    struct Font {
        static let title = phosphateMain(50)
        
        static let subTitle = phosphateMain(24)
        
        static let miniTitle = phosphateMain(20)
        
        static let slogan = phosphateMain(14)
        
        static let chatTitle = phosphateMain(36)
        
        static func phosphateMain(_ size: CGFloat = 12) -> UIFont {
            return UIFont(name: "GillSans-UltraBold", size: size)!
        }
 
    }
}
