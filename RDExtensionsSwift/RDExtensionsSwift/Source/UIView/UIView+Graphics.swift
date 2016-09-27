//
//  UIView+Graphics.swift
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

extension UIView {
    
    /// RDExtensionsSwift: Generate and return the screenshot of the receiver. Returns UIImage
    public func screenshot(rect: CGRect? = nil) -> UIImage?
    {
        var image : UIImage?
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        if let context = UIGraphicsGetCurrentContext()
        {
            self.layer.renderInContext(context)
            if let r = rect
            {
                CGContextClearRect(context, r)
            }
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    /// RDExtensionsSwift: Convert UIView to UIImage
    public var toImage : UIImage?
    {
        var image : UIImage?
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        if(self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true) == true)
        {
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}
