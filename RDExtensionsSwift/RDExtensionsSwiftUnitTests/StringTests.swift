//
//  StringTests.swift
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

open class StringTests : XCTestCase {
    
    func testConversions()
    {
        XCTAssertTrue("TRUE".toBool == true)
        XCTAssertTrue("True".toBool == true)
        XCTAssertTrue("true".toBool == true)
        XCTAssertTrue("YES".toBool == true)
        XCTAssertTrue("Yes".toBool == true)
        XCTAssertTrue("yes".toBool == true)
        XCTAssertTrue("1".toBool == true)
        XCTAssertTrue("FALSE".toBool == false)
        XCTAssertTrue("False".toBool == false)
        XCTAssertTrue("false".toBool == false)
        XCTAssertTrue("NO".toBool == false)
        XCTAssertTrue("No".toBool == false)
        XCTAssertTrue("no".toBool == false)
        XCTAssertTrue("0".toBool == false)
        
        XCTAssertEqual("-123".toInt, -123)
        XCTAssertEqual("-123".toInt8, -123)
        XCTAssertEqual("-123".toInt16, -123)
        XCTAssertEqual("-123456".toInt32, -123456)
        XCTAssertEqual("-12345678901234".toInt64, -12345678901234)
        XCTAssertEqual("123".toFloat, 123)
        XCTAssertEqual("123".toCGFloat, 123)
        XCTAssertEqual("123".toDouble, 123)
        XCTAssertEqual("123".toTimeInterval, 123)
        XCTAssertNotNil("www.example.com".toHttpURL)
        XCTAssertNotNil("example/file".toFileURL)
    }
    
    func testLength()
    {
        XCTAssertEqual("12345".length, 5)
    }
    
    func testCondenseWhiteSpace()
    {
        XCTAssertEqual("   1 2 3 4   ".condenseWhiteSpace(), "1 2 3 4")
    }
    
    func testSubstringTo()
    {
        XCTAssertEqual("0123456789".substring(to: 5), "01234")
    }
    
    func testSubstringFromLength()
    {
        XCTAssertEqual("0123456789".substring(from: 5, length: 2), "56")
    }
    
    func testSubstringFrom()
    {
        XCTAssertEqual("0123456789".substring(from: 5), "56789")
    }
    
    func testSubstring()
    {
        XCTAssertEqual("0123456789".substring(from: 4, to: 7), "456")
    }
    
    func testRange()
    {
        let r1 = "0123456789".range("456")
        let r2 = NSMakeRange(4, 3)
        XCTAssertEqual(r1.location, r2.location)
        XCTAssertEqual(r1.length, r2.length)
    }
    
    func testStringByAppendingPathComponent()
    {
        XCTAssertEqual("/folder/subfolder".stringByAppendingPathComponent("subfolder2/file"), "/folder/subfolder/subfolder2/file")
    }
    
    func testStringByReplacingCharactersInRange()
    {
        XCTAssertEqual("0123456789".replacingCharacters(in: NSMakeRange(4, 3), with: "000"), "0123000789")
    }
    
    func testReplaceCharactersInRange()
    {
        var string = "0123456789"
        string.replaceCharacters(in: NSMakeRange(4, 3), with: "000")
        XCTAssertEqual(string, "0123000789")
    }
    
    func testValidate()
    {
        XCTAssertTrue("#hashtag".validate("#.*"))
    }
    
    func testMatches()
    {
        do
        {
            let array = try "name1 name2 name3".matches("[a-zA-Z]{4}[0-9]{1}")
            XCTAssertEqual(array, ["name1", "name2", "name3"])
        }
        catch
        {
            XCTAssertFalse(true)
        }
    }
    
    func testRanges()
    {
        do
        {
            let array = try "name1 name2 name3".ranges("name")
            let finalArray = [NSMakeRange(0, 4), NSMakeRange(6, 4), NSMakeRange(12, 4)]
            for i in 0 ..< array.count
            {
                let lhs = array[i]
                let rhs = finalArray[i]
                XCTAssertEqual(lhs.location, rhs.location)
                XCTAssertEqual(lhs.length, rhs.length)
            }
        }
        catch
        {
            XCTAssertFalse(true)
        }
    }
    
    func testSubscripts()
    {
        XCTAssertEqual("123"[1], Character("2"))
        XCTAssertEqual("123"[1].toString, "2")
        XCTAssertEqual("123"[NSMakeRange(1, 1)], "2")
    }
    
    func testTheSmallestAndLargestWord()
    {
        XCTAssertEqual("Lorem ipsum dolor sit amet, at erroribus repudiare eos.".smallestWord, "at")
        XCTAssertEqual("Lorem ipsum dolor sit amet, at erroribus repudiare eos.".largestWord, "erroribus")
    }
    
}
