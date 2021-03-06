//
//  IntTests.swift
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

open class IntTests : XCTestCase {
    
    func testToCharacter()
    {
        XCTAssertEqual(97.toCharacter, Character("a"))
        XCTAssertEqual(122.toCharacter, Character("z"))
    }
    
    func testToString()
    {
        XCTAssertEqual(47382903.toString, "47382903")
    }
    
    func testToInt()
    {
        let value : Int64 = 47382903
        XCTAssertEqual(47382903.toInt64, value)
    }
    
    func testToCGFloat()
    {
        XCTAssertEqual(47382903.toCGFloat, CGFloat(47382903))
    }
    
    func testToFloat()
    {
        XCTAssertEqual(47382903.toFloat, Float(47382903))
    }
    
    func testToDouble()
    {
        XCTAssertEqual(47382903.toDouble, Double(47382903))
    }
    
    func testToBool()
    {
        XCTAssertEqual(1.toBool, true)
        XCTAssertEqual(0.toBool, false)
    }
    
}
