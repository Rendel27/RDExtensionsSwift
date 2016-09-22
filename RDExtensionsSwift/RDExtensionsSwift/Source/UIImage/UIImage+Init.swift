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

extension UIImage {
    
    public static func download(url: NSURL, completeInMainThread: Bool = true, completion: ((image: UIImage?, id: String) -> Void)?) -> String
    {
        return NSData.download(url, completion: { (data, id) in
            var img : UIImage?
            if let d = data
            {
                img = UIImage(data: d)
            }
            if(completeInMainThread)
            {
                dispatch_async(dispatch_get_main_queue(), {
                    completion?(image: img, id: id)
                })
            }
            else
            {
                completion?(image: img, id: id)
            }
        })
    }
    
    @objc(gifWithName:)
    public static func gif(named: String) -> UIImage?
    {
        var image : UIImage?
        if let n = named.componentsSeparatedByString(".gif").first, url = NSBundle.mainBundle().URLForResource(n, withExtension: ".gif")
        {
            image = self.gif(url)
        }
        return image
    }
    
    @objc(gifWithURL:)
    public static func gif(url: NSURL) -> UIImage?
    {
        var image : UIImage?
        if let s = CGImageSourceCreateWithURL(url, nil)
        {
            image = self.gif(s)
        }
        return image
    }
    
    @objc(gifWithData:)
    public static func gif(data: NSData) -> UIImage?
    {
        var image : UIImage?
        if let d = CGImageSourceCreateWithData(data, nil)
        {
            image = self.gif(d)
        }
        return image
    }
    
    @objc(gifWithSource:)
    public static func gif(source: CGImageSourceRef) -> UIImage?
    {
        let count = CGImageSourceGetCount(source)
        var images : [CGImageRef] = []
        var delay : [Int] = []
        for i in 0.stride(to: count, by: 1)
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
            for i in 1.stride(to: count, by: 1)
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
            
            for i in 0.stride(to: count, by: 1)
            {
                let frame = UIImage(CGImage: images[i])
                for _ in 0.stride(through: delay[i] / hcf, by: 1).reverse()
                {
                    frames.append(frame)
                }
            }
        }
        else
        {
            print("GIF ERROR: Cannot extract gif frames")
        }
        return UIImage.animatedImageWithImages(frames, duration: NSTimeInterval(td)/100)
    }
    
}
