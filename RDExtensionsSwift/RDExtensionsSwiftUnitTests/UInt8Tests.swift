//
//  UInt8Tests.swift
//
//  Created by Giorgi Iashvili on 24.09.16.
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

import XCTest
import RDExtensionsSwift

open class UInt8Tests : XCTestCase {
    
    let int8Value : UInt8 = 47
    
    func testToString()
    {
        XCTAssertEqual(self.int8Value.toString, "47")
    }
    
    func testToInt()
    {
        XCTAssertEqual(self.int8Value.toInt, Int(self.int8Value))
        XCTAssertEqual(self.int8Value.toInt32, Int32(self.int8Value))
        XCTAssertEqual(self.int8Value.toInt64, Int64(self.int8Value))
    }
    
    func testToCGFloat()
    {
        XCTAssertEqual(self.int8Value.toCGFloat, CGFloat(self.int8Value))
    }
    
    func testToFloat()
    {
        XCTAssertEqual(self.int8Value.toFloat, Float(self.int8Value))
    }
    
    func testToDouble()
    {
        XCTAssertEqual(self.int8Value.toDouble, Double(self.int8Value))
    }
    
    func testToBool()
    {
        XCTAssertEqual(1.toBool, true)
        XCTAssertEqual(0.toBool, false)
    }
    
}
