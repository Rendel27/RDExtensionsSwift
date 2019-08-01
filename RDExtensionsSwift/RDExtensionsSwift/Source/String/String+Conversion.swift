//
//  String+Conversion.swift
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
    
    /// RDExtensionsSwift: Convert String to Bool
    var toBool : Bool?
    {
        get
        {
            switch self
            {
            case "TRUE", "True", "true", "YES", "Yes", "yes", "1":
                return true
            case "FALSE", "False", "false", "NO", "No", "no", "0":
                return false
            default:
                return nil
            }
        }
    }
    
    /// RDExtensionsSwift: Convert String to Int
    var toInt : Int { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.intValue } }
    
    /// RDExtensionsSwift: Convert String to Int8
    var toInt8 : Int8 { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.int8Value } }
    
    /// RDExtensionsSwift: Convert String to Int16
    var toInt16 : Int16 { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.int16Value } }
    
    /// RDExtensionsSwift: Convert String to Int32
    var toInt32 : Int32 { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.int32Value } }
    
    /// RDExtensionsSwift: Convert String to Int64
    var toInt64 : Int64 { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.int64Value } }
    
    /// RDExtensionsSwift: Convert String to Float
    var toFloat : Float { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.floatValue } }
    
    /// RDExtensionsSwift: Convert String to CGFloat
    var toCGFloat : CGFloat { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : CGFloat(number.floatValue) } }
    
    /// RDExtensionsSwift: Convert String to Double
    var toDouble : Double { get { let number = NSDecimalNumber(string: self); return number == NSDecimalNumber.notANumber ? 0 : number.doubleValue } }
    
    /// RDExtensionsSwift: Convert String to NSTimeInterval
    var toTimeInterval : TimeInterval { get { return self.toDouble } }
    
    /// RDExtensionsSwift: Convert String to NSDecimalNumber
    var toNSDecimalNumber : NSDecimalNumber? { get { let number = NSDecimalNumber(string: self); return number == .notANumber ? nil : number } }
    
    /// RDExtensionsSwift: Convert String to NSDecimalNumber. Returns zero if covert was unsuccessful.
    var toNSDecimalNumberValue: NSDecimalNumber { get { return self.toNSDecimalNumber ?? .zero } }
    
    /// RDExtensionsSwift: Convert String to NSURL
    var toHttpURL : URL? { get { return URL(string: self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self) } }
    
    /// RDExtensionsSwift: Convert String to NSURL
    var toFileURL : URL? { get { return URL(fileURLWithPath: self) } }
    
}
