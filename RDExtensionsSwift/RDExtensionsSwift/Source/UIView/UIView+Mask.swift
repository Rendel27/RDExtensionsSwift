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

public extension UIView {
    
    /// RDExtensionsSwift: Mask the receiver outside of the frame with given corner radius
    func outterMask(_ frame: CGRect, cornerRadius : CGFloat = 0)
    {
        let layerMask = CALayer()
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.size.width, height: frame.size.height), true, 0.0);
        let viewMask = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        viewMask.backgroundColor = UIColor.black
        if let ctx = UIGraphicsGetCurrentContext()
        {
            viewMask.layer.render(in: ctx)
            if let blackImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
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
    func innerMask(_ frame: CGRect, cornerRadius : CGFloat = 0)
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.size.width, height: frame.size.height), true, 0.0)
        let blackImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(self.frame.size)
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        UIColor(white: 1, alpha: 0).setFill()
        context.setBlendMode(.destinationIn)
        blackImage.draw(in: frame, blendMode: .normal, alpha: 1)
        var mergedImage : UIImage?
        mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        mergedImage = mergedImage?.invertTransparancy()
        
        let layerMask : CALayer = CALayer()
        layerMask.contents = mergedImage?.cgImage
        layerMask.frame = self.frame
        layerMask.cornerRadius = cornerRadius
        self.layer.mask = layerMask
    }
    
    /// RDExtensionsSwift: Mask the receiver in/out side of give frame
    func mask(with rect: CGRect, inverse: Bool = false)
    {
        let path = UIBezierPath(rect: rect)
        let maskLayer = CAShapeLayer()
        if(inverse)
        {
            path.append(UIBezierPath(rect: self.bounds))
            maskLayer.fillRule = .evenOdd
        }
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    /// RDExtensionsSwift: Remove mask from the receiver
    func removeMask()
    {
        self.layer.mask = nil
    }
    
    /// RDExtensionsSwift: Check if the receiver is masked
    var isMasked : Bool { get { return self.layer.mask != nil } }
    
}
