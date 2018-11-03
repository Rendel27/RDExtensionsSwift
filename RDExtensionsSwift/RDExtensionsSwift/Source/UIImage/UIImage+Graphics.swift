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

public extension UIImage {
    
    /// RDExtensionsSwift: Invert Transparency of the receiver and return
    func invertTransparancy() -> UIImage?
    {
        var img : UIImage?
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let r : CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        if let ctx : CGContext = UIGraphicsGetCurrentContext()
        {
            ctx.setFillColor(red: 1, green: 1, blue: 1, alpha: 1)
            ctx.fill(r)
            self.draw(in: r, blendMode: .destinationOut, alpha: 1)
            img = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return img
    }
    
    /// RDExtensionsSwift: Return color at given pixel
    func color(_ pixel: CGPoint) -> UIColor
    {
        let data = CFDataGetBytePtr(self.cgImage?.dataProvider?.data)
        let index = Int((self.size.width*pixel.y + pixel.x)*4)
        let red = data?[index]
        let green = data?[index + 1]
        let blue = data?[index + 2]
        let alpha = data?[index + 3]
        return UIColor(red: red!.toCGFloat/255, green: green!.toCGFloat/255, blue: blue!.toCGFloat/255, alpha: alpha!.toCGFloat/255)
    }
    
    /// RDExtensionsSwift: Return rescaled image
    func rescale(_ scale: CGFloat) -> UIImage?
    {
        return self.resize(CGSize(width: self.size.width*scale, height: self.size.height*scale))
    }
    
    /// RDExtensionsSwift: Return resized image
    func resize(_ size: CGSize) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    /// RDExtensionsSwift: Cut and return circle from the receiver by given radius
    func cutCircle(_ radius: CGFloat) -> UIImage?
    {
        var image : UIImage?
        let rect = CGRect(x: 0, y: 0, width: radius*4, height: radius*4)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1)
        if let context = UIGraphicsGetCurrentContext()
        {
            context.clear(rect)
            let path = UIBezierPath(roundedRect:CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height), cornerRadius:rect.size.width)
            path.addClip()
            self.draw(in: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    /// RDExtensionsSwift: Rotate receiver and return
    func imageByRotation(_ degrees: CGFloat) -> UIImage
    {
        let rotatedViewBox = UIView(frame: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let t = CGAffineTransform(rotationAngle: degrees * CGFloat(Double.pi) / 180)
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        bitmap?.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2)
        bitmap?.rotate(by: degrees * CGFloat(Double.pi) / 180)
        bitmap?.scaleBy(x: 1.0, y: -1.0)
        bitmap?.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /// RDExtensionsSwift: Change orientation of the receiver and return
    func changeOrientation(_ orientation: UIImage.Orientation) -> UIImage?
    {
        var image : UIImage?
        if let img = self.cgImage
        {
            image = UIImage(cgImage: img, scale: self.scale, orientation: orientation)
        }
        return image
    }
    
    /// RDExtensionsSwift: Change tint color of the receiver and return
    func tint(with color: UIColor) -> UIImage?
    {
        if let maskImage = self.cgImage
        {
            let width = self.size.width
            let height = self.size.height
            let bounds = CGRect(x: 0, y: 0, width: width, height: height)
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
            if let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
            {
                context.clip(to: bounds, mask: maskImage)
                context.setFillColor(color.cgColor)
                context.fill(bounds)
                
                if let cgImage = context.makeImage()
                {
                    let coloredImage = UIImage(cgImage: cgImage)
                    return coloredImage
                }
            }
        }
        return nil
    }
    
    /// RDExtensionsSwift: Invert colors of the receiver and return
    func invertColors() -> UIImage?
    {
        let coreImage = CIImage(image: self)
        guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(coreImage, forKey: kCIInputImageKey)
        guard let result = filter.value(forKey: kCIOutputImageKey) as? CIImage else { return nil }
        return UIImage(ciImage: result)
    }
    
}
