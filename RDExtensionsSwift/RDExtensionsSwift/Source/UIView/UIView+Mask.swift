//
//  UIView+Mask.swift
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
    
    /// RDExtensionsSwift: Mask the receiver outside of the frame with given corner radius
    public func outterMask(frame: CGRect, cornerRadius : CGFloat = 0)
    {
        let layerMask = CALayer()
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(frame.size.width, frame.size.height), true, 0.0);
        let viewMask = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        viewMask.backgroundColor = UIColor.blackColor()
        if let ctx = UIGraphicsGetCurrentContext()
        {
            viewMask.layer.renderInContext(ctx)
            if let blackImage = UIGraphicsGetImageFromCurrentImageContext()?.CGImage
            {
                layerMask.contents = blackImage
                layerMask.frame = frame
                layerMask.cornerRadius = cornerRadius
                self.layer.mask = layerMask
            }
        }
        UIGraphicsEndImageContext()
    }
    
    /// RDExtensionsSwift: Mask the receiver inside of the frame with given corner radius
    public func innerMask(frame: CGRect, cornerRadius : CGFloat = 0)
    {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(frame.size.width, frame.size.height), true, 0.0)
        let blackImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(self.frame.size)
        let context : CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSaveGState(context)
        UIColor(white: 1, alpha: 0).setFill()
        CGContextSetBlendMode(context, .DestinationIn)
        blackImage.drawInRect(frame, blendMode: .Normal, alpha: 1)
        var mergedImage : UIImage?
        mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        mergedImage = mergedImage?.invertTransparancy()
        
        let layerMask : CALayer = CALayer()
        layerMask.contents = mergedImage?.CGImage
        layerMask.frame = self.frame
        layerMask.cornerRadius = cornerRadius
        self.layer.mask = layerMask
    }
    
    /// RDExtensionsSwift: Remove mask from the receiver
    public func removeMask()
    {
        self.layer.mask = nil
    }
    
    /// RDExtensionsSwift: Check if the receiver is masked
    public var masked : Bool { get { return self.layer.mask != nil } }
    
}
