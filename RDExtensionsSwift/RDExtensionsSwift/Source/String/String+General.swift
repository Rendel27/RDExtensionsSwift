//
//  String.swift
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

extension String {
    
    public var length : Int { get { return self.utf16.count } }
    
    public func condenseWhiteSpace() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    public func substringTo(index: Int) -> String
    {
        return self.length < index ? "" : self[NSMakeRange(0, index)]
    }
    
    public func substringFrom(index: Int) -> String
    {
        return self[NSMakeRange(index, self.utf16.count - index)]
    }
    
    public func substring(from: Int, to: Int) -> String
    {
        return self.substringTo(to).substringFrom(from)
    }
    
    public func range(string: String) -> NSRange
    {
        return (self as NSString).rangeOfString(string)
    }
    
    public func stringByAppendingPathComponent(string: String) -> String
    {
        return (self as NSString).stringByAppendingPathComponent(string)
    }
    
    public func stringByReplacingCharactersInRange(range: NSRange, withString replacement: String) -> String
    {
        return (self as NSString).stringByReplacingCharactersInRange(range, withString: replacement)
    }
    
    public mutating func replaceCharactersInRange(range: NSRange, withString replacement: String)
    {
        self = self.stringByReplacingCharactersInRange(range, withString: replacement)
    }
    
    public func validate(regex: String) -> Bool
    {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluateWithObject(self)
    }
    
    public func matches(regex: String, regexOptions: NSRegularExpressionOptions = [], matchingOptions: NSMatchingOptions = []) throws -> [String]
    {
        var matches : [String] = []
        for match in try NSRegularExpression(pattern: regex, options: regexOptions).matchesInString(self, options: matchingOptions, range: NSMakeRange(0, self.utf16.count))
        {
            matches.append(self[match.range])
        }
        return matches
    }
    
    public func ranges(string: String, matchingOptions: NSMatchingOptions = []) throws -> [NSRange]
    {
        var ranges : [NSRange] = []
        for match in try NSRegularExpression(pattern: string, options: []).matchesInString(self, options: matchingOptions, range: NSMakeRange(0, self.utf16.count))
        {
            ranges.append(match.range)
        }
        return ranges
    }
    
    public func visibleStringInRect(rect: CGRect, withFont font: UIFont) -> String
    {
        var visibleString = ""
        for i in 0 ..< self.length
        {
            let testString = self.substringTo(i)
            let stringSize = (testString as NSString).sizeWithAttributes([NSFontAttributeName : font])
            if(stringSize.height > rect.size.height || stringSize.width > rect.size.width)
            {
                break
            }
            visibleString = testString
        }
        return visibleString
    }
    
}
