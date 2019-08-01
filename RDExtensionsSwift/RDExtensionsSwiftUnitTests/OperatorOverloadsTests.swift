//
//  OperatorOverloadsTests.swift
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

open class OperatorOverloadsTests : XCTestCase {
    
    let intNumber : Int = 1
    let cgfloatNumber : CGFloat = 1
    let floatNumber : Float = 1
    let doubleNumber : Double = 1
    var firstArray : [NSObject] = [NSObject(), NSObject()]
    let secondArray : [NSObject] = [NSObject(), NSObject()]
    
    // MARK: Test overloaded opertors for Int and CGFloat
    
    func testIntPlusCGFloat()
    {
        let ans : CGFloat = 2
        XCTAssertEqual(intNumber + cgfloatNumber, ans)
    }
    
    func testIntMinusCGFloat()
    {
        let ans : CGFloat = 0
        XCTAssertEqual(intNumber - cgfloatNumber, ans)
    }
    
    func testIntMultiplyCGFloat()
    {
        let ans : CGFloat = 1
        XCTAssertEqual(intNumber * cgfloatNumber, ans)
    }
    
    func testIntDivideCGFloat()
    {
        let ans : CGFloat = 1
        XCTAssertEqual(intNumber / cgfloatNumber, ans)
    }
    
    func testCGFloatPlusInt()
    {
        let ans : CGFloat = 2
        XCTAssertEqual(intNumber + cgfloatNumber, ans)
    }
    
    func testCGFloatMinusInt()
    {
        let ans : CGFloat = 0
        XCTAssertEqual(intNumber - cgfloatNumber, ans)
    }
    
    func testCGFloatMultiplyInt()
    {
        let ans : CGFloat = 1
        XCTAssertEqual(intNumber * cgfloatNumber, ans)
    }
    
    func testCGFloatDivideInt()
    {
        let ans : CGFloat = 1
        XCTAssertEqual(intNumber / cgfloatNumber, ans)
    }
    
    // MARK: Test overloaded opertors for Int and Float
    
    func testIntPlusFloat()
    {
        let ans : Float = 2
        XCTAssertEqual(intNumber + floatNumber, ans)
    }
    
    func testIntMinusFloat()
    {
        let ans : Float = 0
        XCTAssertEqual(intNumber - floatNumber, ans)
    }
    
    func testIntMultiplyFloat()
    {
        let ans : Float = 1
        XCTAssertEqual(intNumber * floatNumber, ans)
    }
    
    func testIntDivideFloat()
    {
        let ans : Float = 1
        XCTAssertEqual(intNumber / floatNumber, ans)
    }
    
    func testFloatPlusInt()
    {
        let ans : Float = 2
        XCTAssertEqual(intNumber + floatNumber, ans)
    }
    
    func testFloatMinusInt()
    {
        let ans : Float = 0
        XCTAssertEqual(intNumber - floatNumber, ans)
    }
    
    func testFloatMultiplyInt()
    {
        let ans : Float = 1
        XCTAssertEqual(intNumber * floatNumber, ans)
    }
    
    func testFloatDivideInt()
    {
        let ans : Float = 1
        XCTAssertEqual(intNumber / floatNumber, ans)
    }
    
    // MARK: Test overloaded opertors for Int and Double
    
    func testIntPlusDouble()
    {
        let ans : Double = 2
        XCTAssertEqual(intNumber + doubleNumber, ans)
    }
    
    func testIntMinusDouble()
    {
        let ans : Double = 0
        XCTAssertEqual(intNumber - doubleNumber, ans)
    }
    
    func testIntMultiplyDouble()
    {
        let ans : Double = 1
        XCTAssertEqual(intNumber * doubleNumber, ans)
    }
    
    func testIntDivideDouble()
    {
        let ans : Double = 1
        XCTAssertEqual(intNumber / doubleNumber, ans)
    }
    
    func testDoublePlusInt()
    {
        let ans : Double = 2
        XCTAssertEqual(intNumber + doubleNumber, ans)
    }
    
    func testDoubleMinusInt()
    {
        let ans : Double = 0
        XCTAssertEqual(intNumber - doubleNumber, ans)
    }
    
    func testDoubleMultiplyInt()
    {
        let ans : Double = 1
        XCTAssertEqual(intNumber * doubleNumber, ans)
    }
    
    func testDoubleDivideInt()
    {
        let ans : Double = 1
        XCTAssertEqual(intNumber / doubleNumber, ans)
    }
    
    // MARK: Test overloaded opertors for Arrays
    
    func testArrayPlusArray()
    {
        let ans : [NSObject] = firstArray + secondArray
        firstArray += secondArray
        XCTAssertEqual(firstArray, ans)
    }
    
    // MARK: Test overloaded opertors for Nullable Types
    
    func testNullableTypeOperators()
    {
        var intA : Int? = 1
        var intB : Int? = 2
        XCTAssertFalse(intA > intB)
        XCTAssertTrue(intA < intB)
        XCTAssertTrue(intA !> intB)
        XCTAssertFalse(intA !< intB)
        XCTAssertFalse(intA >= intB)
        XCTAssertTrue(intA <= intB)
        
        let floatA : Float? = 1.1
        let floatB : Float? = 2.2
        XCTAssertFalse(floatA > floatB)
        XCTAssertTrue(floatA < floatB)
        XCTAssertTrue(floatA !> floatB)
        XCTAssertFalse(floatA !< floatB)
        XCTAssertFalse(floatA >= floatB)
        XCTAssertTrue(floatA <= floatB)
        
        intB = 3
        intA ?= intB
        XCTAssertTrue(intA == intB)
        XCTAssertFalse(intA == nil)
    }
    
    func testNSDecimalNumberOperators()
    {
        XCTAssertEqual(NSDecimalNumber(1.1) + NSDecimalNumber(2.2), NSDecimalNumber(3.3))
        XCTAssertEqual(NSDecimalNumber(1.1) - NSDecimalNumber(2.2), NSDecimalNumber(-1.1))
        XCTAssertEqual(NSDecimalNumber(1.1) * NSDecimalNumber(2.2), NSDecimalNumber(2.42))
        XCTAssertEqual(NSDecimalNumber(1.1) / NSDecimalNumber(2.2), NSDecimalNumber(0.5))
        XCTAssertEqual(NSDecimalNumber(1.1) ^ 2, NSDecimalNumber(1.21))
        
        XCTAssertTrue(NSDecimalNumber(1.1) < NSDecimalNumber(2.2))
        XCTAssertTrue(NSDecimalNumber(1.1) <= NSDecimalNumber(2.2))
        XCTAssertTrue(NSDecimalNumber(1.1) == NSDecimalNumber(1.1))
        XCTAssertTrue(NSDecimalNumber(2.2) > NSDecimalNumber(1.1))
        XCTAssertTrue(NSDecimalNumber(2.2) >= NSDecimalNumber(1.1))
    }
    
}
