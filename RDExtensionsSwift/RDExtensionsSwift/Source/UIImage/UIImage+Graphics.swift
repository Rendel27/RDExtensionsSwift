//
//  UIImage+Graphics.swift
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

extension UIImage {
    
    public func invertTransparancy() -> UIImage?
    {
        var img : UIImage?
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let r : CGRect = CGRectMake(0, 0, self.size.width, self.size.height)
        if let ctx : CGContextRef = UIGraphicsGetCurrentContext()
        {
            CGContextSetRGBFillColor(ctx, 1, 1, 1, 1)
            CGContextFillRect(ctx, r)
            self.drawInRect(r, blendMode: .DestinationOut, alpha: 1)
            img = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return img
    }
    
    public func color(pixel: CGPoint) -> UIColor
    {
        let data = CFDataGetBytePtr(CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage)))
        let index = Int((self.size.width*pixel.y + pixel.x)*4)
        let red = data[index]
        let green = data[index + 1]
        let blue = data[index + 2]
        let alpha = data[index + 3]
        return UIColor(red: red.toCGFloat/255, green: green.toCGFloat/255, blue: blue.toCGFloat/255, alpha: alpha.toCGFloat/255)
    }
    
    public func rescale(scale: CGFloat) -> UIImage?
    {
        return self.resize(CGSizeMake(self.size.width*scale, self.size.height*scale))
    }
    
    public func resize(size: CGSize) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    public func cutCircle(radius: CGFloat) -> UIImage?
    {
        var image : UIImage?
        let rect = CGRectMake(0, 0, radius*4, radius*4)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1)
        if let context = UIGraphicsGetCurrentContext()
        {
            CGContextClearRect(context, rect)
            let path = UIBezierPath(roundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height), cornerRadius:rect.size.width)
            path.addClip()
            self.drawInRect(CGRectMake(0, 0, rect.size.width, rect.size.height))
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    public func imageByRotation(degrees: CGFloat) -> UIImage
    {
        let rotatedViewBox = UIView(frame: CGRectMake(0, 0, self.size.width, self.size.height))
        let t = CGAffineTransformMakeRotation(degrees * CGFloat(M_PI) / 180)
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2)
        CGContextRotateCTM(bitmap, degrees * CGFloat(M_PI) / 180)
        CGContextScaleCTM(bitmap, 1.0, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), self.CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public func changeOrientation(orientation: UIImageOrientation) -> UIImage?
    {
        var image : UIImage?
        if let img = self.CGImage
        {
            image = UIImage(CGImage: img, scale: self.scale, orientation: orientation)
        }
        return image
    }
    
}
