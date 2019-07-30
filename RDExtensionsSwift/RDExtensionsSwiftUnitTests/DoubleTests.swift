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
    
    func testToString()
    {
        XCTAssertEqual(0.123456789.toString, "0.123456789")
        XCTAssertEqual(0.123456789.toString(), "0.12")
        XCTAssertEqual(0.123456789.toString(rounding: 1), "0.1")
        XCTAssertEqual(1.00.toString(trimZeros: true), "1")
        XCTAssertEqual(1.0.toString(trimZeros: true), "1")
    }
    
    func testToInt()
    {
        XCTAssertEqual(123.4567.toInt, 123)
        XCTAssertEqual(123.567.toInt, 123)
        XCTAssertEqual(123.4567.toInt8, 123)
        XCTAssertEqual(123.567.toInt8, 123)
        XCTAssertEqual(123.4567.toInt16, 123)
        XCTAssertEqual(123.567.toInt16, 123)
        XCTAssertEqual(123.4567.toInt32, 123)
        XCTAssertEqual(123.567.toInt32, 123)
        XCTAssertEqual(123.4567.toInt64, 123)
        XCTAssertEqual(123.567.toInt64, 123)
    }
    
//    func testToCGFloat()
//    {
//        XCTAssertEqual(123.4567.toCGFloat, 123.4567 as CGFloat)
//        XCTAssertEqual(-123.4567.toCGFloat, -123.4567 as CGFloat)
//    }
//
//    func testToFloat()
//    {
//        XCTAssertEqual(123.4567.toFloat, 123.4567 as Float)
//        XCTAssertEqual(-123.4567.toFloat, -123.4567 as Float)
//    }
    
}
