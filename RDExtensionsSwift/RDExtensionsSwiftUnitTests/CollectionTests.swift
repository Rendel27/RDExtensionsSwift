//
//  CollectionTests.swift
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

open class CollectionTests : XCTestCase {
    
    func testLambdaExpression()
    {
        let array = [1, 2, 3]
        var count = 0
        array.lambda { i in
            XCTAssertEqual(array[count], i)
            count += 1
        }
        XCTAssertEqual(array.count, count)
    }
    
    func testToInt()
    {
        XCTAssertEqual(["1", "2", "3"].toInt, [1, 2, 3])
    }
    
    func testObjectAtIndexPath()
    {
        let o = NSObject()
        let array = [[NSObject()], [o, NSObject()]]
        XCTAssertEqual(array[IndexPath(row: 0, section: 1)], o)
    }
    
    func testRemoveObjectAtIndexPath()
    {
        let o1 = NSObject()
        let o2 = NSObject()
        let o3 = NSObject()
        var array = [[o1], [o2, o3]]
        let finalArray = [[o1], [o3]]
        XCTAssertEqual(array.remove(at: IndexPath(row: 0, section: 1)), o2)
        for i in 0 ..< array.count
        {
            XCTAssertEqual(array[i], finalArray[i])
        }
    }
    
}
