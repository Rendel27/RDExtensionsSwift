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

extension String {
    
    public var toBool : Bool?
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
    
    public var toInt : Int { return (self as NSString).integerValue }
    
    public var toInt32 : Int32 { return Int32((self as NSString).intValue) }
    
    public var toUInt32 : UInt32 { return UInt32((self as NSString).intValue) }
    
    public var toInt64 : Int64 { return Int64((self as NSString).intValue) }
    
    public var toFloat : Float { get { return (self as NSString).floatValue } }
    
    public var toCGFloat : CGFloat { get { return CGFloat((self as NSString).floatValue) } }
    
    public var toDouble : Double { get { return (self as NSString).doubleValue } }
    
    public var toTimeInterval : NSTimeInterval { get { return (self as NSString).doubleValue } }
    
    public var toHttpURL : NSURL? { return NSURL(string: self) }
    
    public var toFileURL : NSURL? { return NSURL(fileURLWithPath: self) }
    
}
