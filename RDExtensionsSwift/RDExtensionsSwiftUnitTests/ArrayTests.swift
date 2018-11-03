//
//  ArrayTests.swift
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

open class ArrayTests : XCTestCase {
    
    func testFirstAndLastNElements()
    {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        XCTAssertEqual(array.first(n: 2), [0, 1])
        XCTAssertEqual(array.last(n: 2), [8, 9])
    }
    
    func testRemove()
    {
        let o1 = NSObject()
        let o2 = o1
        let o3 = NSObject()
        let o4 = NSObject()
        let o5 = NSObject()
        var array = [o1, o2, o3, o4, o5]
        array.remove(o1)
        XCTAssertEqual(array, [o3, o4, o5])
        array.remove([o2, o3])
        XCTAssertEqual(array, [o4, o5])
    }
    
    func testInsertElementAfter()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        var array = [o1, o2]
        let o3 = NSObject()
        XCTAssert(array.insert(o3, after: o1))
        XCTAssertEqual(array, [o1, o3, o2])
    }
    
    func testInsertElementsAfter()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        var array = [o1, o2]
        let o3 = NSObject()
        let o4 = NSObject()
        XCTAssert(array.insert([o3, o4], after: o1))
        XCTAssertEqual(array, [o1, o3, o4, o2])
    }
    
    func testInsertElementBefore()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        var array = [o1, o2]
        let o3 = NSObject()
        XCTAssert(array.insert(o3, before: o2))
        XCTAssertEqual(array, [o1, o3, o2])
    }
    
    func testInsertElementsBefore()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        var array = [o1, o2]
        let o3 = NSObject()
        let o4 = NSObject()
        XCTAssert(array.insert([o3, o4], before: o2))
        XCTAssertEqual(array, [o1, o3, o4, o2])
    }
    
    func testInsertElementsAtIndex()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        var array = [o1, o2]
        let o3 = NSObject()
        let o4 = NSObject()
        array.insert([o3, o4], at: 1)
        XCTAssertEqual(array, [o1, o3, o4, o2])
    }
    
    func testIndexes()
    {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        XCTAssertEqual(array.indexes(of: [3, 4]), [3, 4])
        XCTAssertEqual(array.indexes(of: [11, 12]), [])
    }
    
    func testPreviousAndNextElement()
    {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        XCTAssertEqual(array.previous(of: 4), 3)
        XCTAssertNil(array.previous(of: 0))
        XCTAssertEqual(array.next(of: 4), 5)
        XCTAssertNil(array.next(of: 9))
    }
    
}
