//
//  CGRect+Layout.swift
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

extension CGRect {
    
    /// RDExtensionsSwift: Get or Set frame origin x
    public var x : CGFloat { get { return self.origin.x } set { self.origin.x = newValue } }
    
    /// RDExtensionsSwift: Get or Set frame origin y
    public var y : CGFloat { get { return self.origin.y } set { self.origin.y = newValue } }
    
    /// RDExtensionsSwift: Get or Set frame center x
    public var centerX : CGFloat { get { return self.x + self.width/2 } set { self.x = newValue - self.width/2 } }
    
    /// RDExtensionsSwift: Get or Set frame center y
    public var centerY : CGFloat { get { return self.y + self.height/2 } set { self.y = newValue - self.height/2 } }
    
    /// RDExtensionsSwift: Get or Set frame last x
    public var lastX : CGFloat { get { return self.x + self.width } set { self.x = newValue + self.width/2 } }
    
    /// RDExtensionsSwift: Get or Set frame last y
    public var lastY : CGFloat { get { return self.y + self.height } set { self.y = newValue + self.height/2 } }
    
    /// RDExtensionsSwift: Get or Set frame center point
    public var center : CGPoint { get { return CGPoint(x: self.centerX, y: self.centerY) } set { self.centerX = newValue.x; self.centerY = newValue.y } }
    
    /// RDExtensionsSwift: Get or Set frame middle point
    public var middle : CGPoint { get { return CGPoint(x: self.width/2, y: self.height/2) } }
    
}
