//
//  NSAttributedString+General.swift
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

extension NSAttributedString {
    
    /// RDExtensionsSwift: Return substring from the begining to the index
    public func substringTo(_ index: Int) -> NSAttributedString
    {
        var r = NSMakeRange(0, self.string.length)
        let attributedStr = NSMutableAttributedString(string: "")
        attributedStr.setAttributes(self.attributes(at: 0, effectiveRange: &r), range: NSMakeRange(0, attributedStr.length))
        return self.length < index ? attributedStr : self.attributedSubstring(from: NSMakeRange(0, index))
    }
    
    /// RDExtensionsSwift: Return substring from the index to the end
    public func substringFrom(_ index: Int) -> NSAttributedString
    {
        var r = NSMakeRange(0, self.string.length)
        let attributedStr = NSMutableAttributedString(string: "")
        attributedStr.setAttributes(self.attributes(at: 0, effectiveRange: &r), range: NSMakeRange(0, attributedStr.length))
        return self.length < index ? attributedStr : self.attributedSubstring(from: NSMakeRange(index, self.string.length - index))
    }
    
    /// RDExtensionsSwift: Return substring from the index to the index
    public func substring(_ from: Int, to: Int) -> NSAttributedString
    {
        return self.substringTo(to).substringFrom(from)
    }
    
}
