//
//  NSDecimalNumber+Conversion.swift
//
//  Created by Giorgi Iashvili on 11.3.18.
//  Copyright (c) 2018 Giorgi Iashvili
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

public extension NSDecimalNumber {
    
    /// RDExtensionsSwift: Return Double as String with rounding
    func toString(rounding: Int = 2, trimZeros: Bool = false) -> String
    {
        var string = self.stringValue
        let components = string.components(separatedBy: ".")
        if components.count == 2,
            let left = components.first,
            let right = components.last
        {
            string = left + "." + right.substring(to: min(right.length, rounding))
        }
        if(trimZeros)
        {
            let components = string.components(separatedBy: ".")
            if components.count == 2,
                components.first != nil,
                let right = components.last
            {
                if(right.count <= 2)
                {
                    if(components.last == "00" || components.last == "0")
                    {
                        string = components.first!
                    }
                }
            }
        }
        return string
    }
    
}
