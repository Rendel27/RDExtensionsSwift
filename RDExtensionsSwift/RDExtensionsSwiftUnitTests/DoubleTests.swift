//
//  DoubleTests.swift
//
//  Created by Giorgi Iashvili on 23.09.16.
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

open class DoubleTests : XCTestCase {
    
    let doubleValue : Double = 47382903
    
    func testToString()
    {
        XCTAssertEqual(Double(0.123456789).toString, "0.123456789")
        XCTAssertEqual(Double(0.123456789).toString(-1), "0.123456789")
        XCTAssertEqual(Double(0.123456789).toString(), "0.12")
        XCTAssertEqual(Double(0.123456789).toString(1), "0.1")
        XCTAssertEqual(Double(0.123456789).toString(8), "0.12345678")
    }
    
    func testToInt()
    {
        XCTAssertEqual(self.doubleValue.toInt, Int(self.doubleValue))
        XCTAssertEqual(self.doubleValue.toInt32, Int32(self.doubleValue))
        XCTAssertEqual(self.doubleValue.toInt64, Int64(self.doubleValue))
        XCTAssertEqual(self.doubleValue.toIntMax, IntMax(self.doubleValue))
    }
    
    func testToCGFloat()
    {
        XCTAssertEqual(self.doubleValue.toCGFloat, CGFloat(self.doubleValue))
    }
    
    func testToFloat()
    {
        XCTAssertEqual(self.doubleValue.toFloat, Float(self.doubleValue))
    }
    
    func testToBool()
    {
        XCTAssertEqual(1.toBool, true)
        XCTAssertEqual(0.toBool, false)
    }
    
}
