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

public extension String {
    
    /// RDExtensionsSwift: Return the smallest word from the string
    var smallestWord : String
    {
        get
        {
            let words = self.components(separatedBy: " ")
            var index = 0
            for i in 0 ..< words.count
            {
                if(words[i].length < words[index].length)
                {
                    index = i
                }
            }
            return words[index]
        }
    }
    
    /// RDExtensionsSwift: Return the largest word from the string
    var largestWord : String
    {
        get
        {
            let words = self.components(separatedBy: " ")
            var index = 0
            for i in 0 ..< words.count
            {
                if(words[i].length > words[index].length)
                {
                    index = i
                }
            }
            return words[index]
        }
    }
    
    /// RDExtensionsSwift: Return length of the string
    var length : Int { get { return self.utf16.count } }
    
    /// RDExtensionsSwift: Trim whitespace characters and return new string
    func condenseWhiteSpace() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// RDExtensionsSwift: Return substring from the begining to the index
    func substring(to index: Int) -> String
    {
        let index = max(0, index)
        return self.length < index ? "" : self[NSMakeRange(0, index)]
    }
    
    /// RDExtensionsSwift: Return substring from the index with the given length
    func substring(from leftIndex: Int, length rightIndex: Int) -> String
    {
        return self[NSMakeRange(leftIndex, rightIndex)]
    }
    
    /// RDExtensionsSwift: Return substring from the index to the end
    func substring(from index: Int) -> String
    {
        return self[NSMakeRange(index, self.utf16.count - index)]
    }
    
    /// RDExtensionsSwift: Return substring from the index to the index
    func substring(from leftIndex: Int, to rightIndex: Int) -> String
    {
        return self.substring(from: leftIndex).substring(to: rightIndex - leftIndex)
    }
    
    /// RDExtensionsSwift: Return range for the given string
    func range(_ string: String) -> NSRange
    {
        return (self as NSString).range(of: string)
    }
    
    /// RDExtensionsSwift: Append the path component and return the new path
    func stringByAppendingPathComponent(_ string: String) -> String
    {
        return (self as NSString).appendingPathComponent(string)
    }
    
    /// RDExtensionsSwift: Return a new string in which the characters in a specified range of the receiver are replaced by a given string
    func replacingCharacters(in range: NSRange, with string: String) -> String
    {
        return (self as NSString).replacingCharacters(in: range, with: string)
    }
    
    /// RDExtensionsSwift: Replace the characters in a specified range by a given string
    mutating func replaceCharacters(in range: NSRange, with string: String)
    {
        self = self.replacingCharacters(in: range, with: string)
    }
    
    /// RDExtensionsSwift: Validate string by given regular expression. Returns true or false
    func validate(_ regex: String) -> Bool
    {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    /// RDExtensionsSwift: Return an array containing substrings of the receiver which are matched by a given regular expression with regex options and matching options
    func matches(_ regex: String, regexOptions: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = []) throws -> [String]
    {
        var matches : [String] = []
        for match in try NSRegularExpression(pattern: regex, options: regexOptions).matches(in: self, options: matchingOptions, range: NSMakeRange(0, self.utf16.count))
        {
            matches.append(self[match.range])
        }
        return matches
    }
    
    /// RDExtensionsSwift: Return an array containing ranges of substrings of the receiver which are matched to a given string with matching options
    func ranges(_ string: String, matchingOptions: NSRegularExpression.MatchingOptions = []) throws -> [NSRange]
    {
        var ranges : [NSRange] = []
        for match in try NSRegularExpression(pattern: string, options: []).matches(in: self, options: matchingOptions, range: NSMakeRange(0, self.utf16.count))
        {
            ranges.append(match.range)
        }
        return ranges
    }
    
    /// RDExtensionsSwift: Return substring which is visible in the given frame with the given font
    func visibleStringInRect(_ rect: CGRect, withFont font: UIFont) -> String
    {
        var visibleString = ""
        for i in 0 ..< self.length
        {
            let testString = self.substring(to: i)
            let stringSize = (testString as NSString).size(withAttributes: [NSAttributedString.Key.font : font])
            if(stringSize.height > rect.size.height || stringSize.width > rect.size.width)
            {
                break
            }
            visibleString = testString
        }
        return visibleString
    }
    
}
