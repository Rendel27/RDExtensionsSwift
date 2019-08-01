//
//  UILabel+General.swift
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

public extension UILabel {
    
    /// RDExtensionsSwift: Return non nilable text
    var string : String { get { return self.text ?? "" } set { self.text = newValue } }
    
    /// RDExtensionsSwift: Return the largest word width from the text
    var largestWordWidth : CGFloat { get { return self.string.largestWord.widthForHeight(self.frame.height, font: self.font) } }
    
    /// RDExtensionsSwift: Calculate and return width of the label for given hight with given font
    var widthForText : CGFloat { return self.string.widthForHeight(self.frame.size.height, font: self.font) }
    
    /// RDExtensionsSwift: Calculate and return height of the label for given width with given font
    var heightForText : CGFloat { return self.string.heightForWidth(self.frame.size.width, font: self.font) }
    
    /// RDExtensionsSwift: Check if label tail is truncated. Returns true or false
    var tailTruncated : Bool
    {
        if let string = self.text,
            let font = self.font
        {
            let size: CGSize = (string as NSString).boundingRect(with: CGSize(width: self.frame.size.width, height: .greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
            if(size.height > self.bounds.size.height)
            {
                return true
            }
        }
        return false
    }
    
    /// RDExtensionsSwift: Truncate tail of the receiver after the given nth characters
    func truncateTail(_ characters: Int, attributed: Bool = false)
    {
        if(attributed)
        {
            if let attributedStr = self.attributedText , attributedStr.length > 4 + characters
            {
                var visibleString = NSAttributedString()
                for i in 1...attributedStr.length
                {
                    let testString = attributedStr.substringTo(i)
                    var r = NSMakeRange(0, testString.string.length)
                    let stringSize = (testString.string as NSString).size(withAttributes: testString.attributes(at: 0, effectiveRange: &r))
                    if(stringSize.height*ceil(stringSize.width/self.frame.width) > self.frame.height)
                    {
                        break
                    }
                    visibleString = testString
                }
                if(self.string.length > visibleString.length)
                {
                    let str1 = visibleString.substringTo(visibleString.length - (5 + characters))
                    let str2 = " ..."
                    let str3 = attributedStr.substringFrom(self.string.length - characters)
                    var r1 = NSMakeRange(0, str1.length)
                    var r2 = NSMakeRange(0, str3.length)
                    let attrStr = NSMutableAttributedString(string: str1.string + str2 + str3.string)
                    attrStr.setAttributes(str1.attributes(at: 0, effectiveRange: &r1), range: NSMakeRange(0, str1.length + str2.length))
                    attrStr.setAttributes(str3.attributes(at: 0, effectiveRange: &r2), range: NSMakeRange(str1.length + str2.length, str3.length))
                    self.attributedText = attrStr
                }
            }
        }
        else
        {
            if(self.string.length > 4 + characters)
            {
                var visibleString = "";
                var attrs: [NSAttributedString.Key: Any] = [:]
                attrs[NSAttributedString.Key.font] = self.font
                for i in 1...self.string.length
                {
                    let testString = self.string.substring(to: i)
                    let stringSize = (testString as NSString).size(withAttributes: attrs)
                    if(stringSize.height*ceil(stringSize.width/self.frame.width) > self.frame.height)
                    {
                        break
                    }
                    visibleString = testString
                }
                if(self.string.length > visibleString.length)
                {
                    self.text = visibleString.substring(to: visibleString.length - (5 + characters)) + " ..." + self.string.substring(from: self.string.length - characters)
                }
            }
        }
    }
    
    /// RDExtensionsSwift: Return the frame for visible text
    var textRect : CGRect
    {
        var tr = self.textRect(forBounds: self.bounds, limitedToNumberOfLines: self.numberOfLines)
        tr.origin.y = (self.bounds.size.height - tr.size.height)/2
        if(self.textAlignment == .center)
        {
            tr.origin.x = (self.bounds.size.width - tr.size.width)/2
        }
        if(self.textAlignment == .right)
        {
            tr.origin.x = self.bounds.size.width - tr.size.width
        }
        return tr
    }
    
    /// RDExtensionsSwift: Return character index at given point
    func characterIndex(_ point: CGPoint) -> Int?
    {
        var point = point
        if let oat = self.attributedText?.mutableCopy() as? NSMutableAttributedString
        {
            self.attributedText?.enumerateAttributes(in: NSMakeRange(0, oat.length), options: [], using: { (attributes, range, stop) in
                if attributes[NSAttributedString.Key.font] == nil,
                    let font = self.font
                {
                    oat.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String as String), value: font, range: range)
                }
                if(attributes[NSAttributedString.Key.paragraphStyle] == nil)
                {
                    let ps = NSMutableParagraphStyle()
                    ps.lineBreakMode = self.lineBreakMode
                    oat.addAttribute(NSAttributedString.Key(rawValue: kCTParagraphStyleAttributeName as String as String), value: ps, range: range)
                }
            })
            oat.enumerateAttribute(NSAttributedString.Key(rawValue: kCTParagraphStyleAttributeName as String as String), in: NSMakeRange(0, oat.length), options: [], using: { (value, range, stop) in
                if let ps = value as? NSMutableParagraphStyle
                {
                    if(ps.lineBreakMode == .byTruncatingTail)
                    {
                        ps.lineBreakMode = .byWordWrapping
                    }
                    oat.removeAttribute(NSAttributedString.Key(rawValue: kCTParagraphStyleAttributeName as String as String), range: range)
                    oat.addAttribute(NSAttributedString.Key(rawValue: kCTParagraphStyleAttributeName as String as String), value: ps, range: range)
                }
            })
            let tr = self.textRect
            if(!self.bounds.contains(point) || !tr.contains(point))
            {
                return nil
            }
            point = CGPoint(x: point.x - tr.origin.x, y: point.y - tr.origin.y)
            point = CGPoint(x: point.x, y: tr.size.height - point.y)
            let frameSetter = CTFramesetterCreateWithAttributedString(oat)
            let path = CGMutablePath()
            path.addRect(tr)
            let f = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, oat.length), path, nil)
            let lines = CTFrameGetLines(f)
            let nol = self.numberOfLines > 0 ? min(self.numberOfLines, CFArrayGetCount(lines)) : CFArrayGetCount(lines)
            if(nol == 0)
            {
                return nil
            }
            var idx : Int?
            let los = UnsafeMutablePointer<CGPoint>.allocate(capacity: nol)
            CTFrameGetLineOrigins(f, CFRangeMake(0, nol), los)
            for li in 0..<nol
            {
                let lo = los[li]
                let line = (lines as Array)[li] as! CTLine
                var a = CGFloat(0)
                var d = CGFloat(0)
                var l = CGFloat(0)
                var w = CGFloat(0)
                w = CGFloat(CTLineGetTypographicBounds(line, &a, &d, &l))
                let minY = floor(lo.y - d)
                let maxY = ceil(lo.y + a)
                if(point.y > maxY)
                {
                    break
                }
                if(point.y >= minY)
                {
                    if(point.x >= lo.x && point.x <= lo.x + w)
                    {
                        let rp = CGPoint(x: point.x - lo.x, y: point.y - lo.y)
                        idx = CTLineGetStringIndexForPosition(line, rp)
                        break
                    }
                }
            }
            return idx
        }
        return nil
    }
    
    /// RDExtensionsSwift: Sets attributed text with given components
    func setAttributedText(_ components: [(String, [NSAttributedString.Key: Any])])
    {
        let attributedText = NSMutableAttributedString(string: components.map { $0.0 }.joined())
        for i in 0 ..< components.count
        {
            attributedText.addAttributes(components[i].1, range: NSRange(location: components[0 ..< i].map { $0.0 }.joined().length, length: components[i].0.length))
        }
        self.attributedText = attributedText
    }
    
    /// RDExtensionsSwift: Sets attributed text with given components
    func addAttributedText(_ components: [(String, [NSAttributedString.Key: Any])])
    {
        let attributedText = NSMutableAttributedString(string: components.map { $0.0 }.joined())
        for i in 0 ..< components.count
        {
            attributedText.addAttributes(components[i].1, range: NSRange(location: components[0 ..< i].map { $0.0 }.joined().length, length: components[i].0.length))
        }
        let newAttributedText = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString())
        newAttributedText.append(attributedText)
        self.attributedText = newAttributedText
    }
    
}
