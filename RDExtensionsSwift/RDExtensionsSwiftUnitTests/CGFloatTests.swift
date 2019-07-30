//
//  CGFloatTests.swift
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

open class CGFloatTests : XCTestCase {
    
    func testFabsf()
    {
        let number = -123.4567 as CGFloat
        XCTAssertEqual(-number, fabsf(number))
    }
    
    func testToString()
    {
        XCTAssertEqual((123.45 as CGFloat).toString, "123.45")
        XCTAssertEqual((0.123456789 as CGFloat).toString(), "0.12")
        XCTAssertEqual((0.123456789 as CGFloat).toString(rounding: 1), "0.1")
        XCTAssertEqual(1.00.toString(trimZeros: true), "1")
        XCTAssertEqual(1.0.toString(trimZeros: true), "1")
    }
    
    func testToInt()
    {
        XCTAssertEqual((123.4567 as CGFloat).toInt, 123)
        XCTAssertEqual((123.4567 as CGFloat).toInt8, 123)
        XCTAssertEqual((123.4567 as CGFloat).toInt16, 123)
        XCTAssertEqual((123.4567 as CGFloat).toInt32, 123)
        XCTAssertEqual((123.4567 as CGFloat).toInt64, 123)
    }
    
//    func testToFloat()
//    {
//        XCTAssertEqual((123.4567 as CGFloat).toFloat, 123.4567 as Float)
//        XCTAssertEqual((-123.4567 as CGFloat).toFloat, -123.4567 as Float)
//    }
//
//    func testToDouble()
//    {
//        XCTAssertEqual((123.4567 as CGFloat).toDouble, 123.4567 as Double)
//        XCTAssertEqual((-123.4567 as CGFloat).toDouble, -123.4567 as Double)
//    }
    
}
