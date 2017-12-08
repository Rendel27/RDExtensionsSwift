//
//  UIImage+Init.swift
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

import ImageIO

public extension UIImage {
    
    /// RDExtensionsSwift: Return newly initialized image from given color with given size
    convenience init(color: UIColor, size: CGSize)
    {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (img?.cgImage!)!)
    }
    
    /// RDExtensionsSwift: Return unique identifier and download image from the given url
    static func download(_ url: URL, completeInMainThread: Bool = true, completion: ((_ image: UIImage?, _ id: String) -> Void)?) -> String
    {
        return Data.download(url, completion: { (data, id) in
            var img : UIImage?
            if let d = data
            {
                img = UIImage(data: d)
            }
            if(completeInMainThread)
            {
                DispatchQueue.main.async(execute: {
                    completion?(img, id)
                })
            }
            else
            {
                completion?(img, id)
            }
        })
    }
    
    /// RDExtensionsSwift: Return newly initialized animated image by given name
    static func gif(_ named: String) -> UIImage?
    {
        var image : UIImage?
        if let n = named.components(separatedBy: ".gif").first, let url = Bundle.main.url(forResource: n, withExtension: ".gif")
        {
            image = self.gif(url)
        }
        return image
    }
    
    /// RDExtensionsSwift: Return newly initialized animated image by given url
    static func gif(_ url: URL) -> UIImage?
    {
        var image : UIImage?
        if let s = CGImageSourceCreateWithURL(url as CFURL, nil)
        {
            image = self.gif(s)
        }
        return image
    }
    
    /// RDExtensionsSwift: Return newly animated image by given data
    static func gif(_ data: Data) -> UIImage?
    {
        var image : UIImage?
        if let d = CGImageSourceCreateWithData(data as CFData, nil)
        {
            image = self.gif(d)
        }
        return image
    }
    
    /// RDExtensionsSwift: Return newly initialized image by given source
    static func gif(_ source: CGImageSource) -> UIImage?
    {
        let count = CGImageSourceGetCount(source)
        var images : [CGImage] = []
        var delay : [Int] = []
        for i in stride(from: 0, to: count, by: 1)
        {
            images.append(CGImageSourceCreateImageAtIndex(source, i, nil)!)
            var d = 1
            if let p = CGImageSourceCopyPropertiesAtIndex(source, i, nil)
            {
                if let gp = (p as Dictionary)[kCGImagePropertyGIFDictionary]
                {
                    if var n = gp[kCGImagePropertyGIFUnclampedDelayTime as String] as? CGFloat
                    {
                        if(n == 0)
                        {
                            n = gp[kCGImagePropertyGIFDelayTime as String] as! CGFloat
                        }
                        else if(n > 0)
                        {
                            d = Int(n * 100)
                        }
                    }
                }
            }
            delay.append(d)
        }
        var td = 0
        for i in delay
        {
            td += i
        }
        var frames : [UIImage] = []
        if(count == images.count && images.count == delay.count && count == delay.count)
        {
            var hcf = delay.first ?? 0
            for i in stride(from: 1, to: count, by: 1)
            {
                var n1 = delay[i]
                var n2 = hcf
                if(n1 > n2)
                {
                    n1 = hcf
                    n2 = delay[i]
                }
                while(true)
                {
                    let x = n1 % n2
                    if(x == 0)
                    {
                        hcf = n2
                        break
                    }
                    n1 = n2
                    n2 = x
                }
            }
            
            for i in stride(from: 0, to: count, by: 1)
            {
                let frame = UIImage(cgImage: images[i])
                for _ in stride(from: 0, through: delay[i] / hcf, by: 1).reversed()
                {
                    frames.append(frame)
                }
            }
        }
        else
        {
            print("GIF ERROR: Cannot extract gif frames")
        }
        return UIImage.animatedImage(with: frames, duration: TimeInterval(td)/100)
    }
    
}
