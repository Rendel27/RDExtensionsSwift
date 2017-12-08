//
//  UIColor+Init.swift
//
//  Created by Giorgi Iashvili on 19.09.16.
//  Copyright (c) 2016 Giorgi Iashvili
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

public extension UIColor {
    
    /// RDExtensionsSwift: Return newly initialized color from red, green, blue and alpha components value from 0 to 255 range
    convenience init(red: Int, green: Int, blue: Int, alpha: Int)
    {
        let red = red < 0 ? 0 : red > 255 ? 255 : red
        let green = green < 0 ? 0 : green > 255 ? 255 : green
        let blue = blue < 0 ? 0 : blue > 255 ? 255 : blue
        let alpha = alpha < 0 ? 0 : alpha > 255 ? 255 : alpha
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    /// RDExtensionsSwift: Return newly initialized color from hex value
    convenience init(hexValue: Int, alpha: Int = 255)
    {
        let red = hexValue >> 16
        let green = hexValue >> 8
        let blue = hexValue
        self.init(red: red & 0xff, green: green & 0xff, blue: blue & 0xff, alpha: alpha)
    }
    
    /// RDExtensionsSwift: Return newly initialized color from hex value
    convenience init(hexString: String, alpha: Int = 255)
    {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let r, g, b : UInt32
        switch hex.length
        {
        case 3:
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (255, 255, 255)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(alpha) / 255)
    }
    
}
