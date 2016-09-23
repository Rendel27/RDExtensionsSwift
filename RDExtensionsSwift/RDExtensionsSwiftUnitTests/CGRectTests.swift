//
//  CGRectTests.swift
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

public class CGRectTests : XCTestCase {
    
    let frame = CGRectMake(1, 2, 3, 4)
    
    func testX()
    {
        XCTAssertEqual(self.frame.x, self.frame.origin.x)
    }
    
    func testY()
    {
        XCTAssertEqual(self.frame.y, self.frame.origin.y)
    }
    
    func testCenterX()
    {
        XCTAssertEqual(self.frame.centerX, self.frame.origin.x + self.frame.size.width/2)
    }
    
    func testCenterY()
    {
        XCTAssertEqual(self.frame.centerY, self.frame.origin.y + self.frame.size.height/2)
    }
    
    func testLastX()
    {
        XCTAssertEqual(self.frame.lastX, self.frame.origin.x + self.frame.size.width)
    }
    
    func testLastY()
    {
        XCTAssertEqual(self.frame.lastY, self.frame.origin.y + self.frame.size.height)
    }
    
    func testCenter()
    {
        XCTAssertEqual(self.frame.center, CGPointMake(self.frame.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height/2))
    }
    
    func testMiddle()
    {
        XCTAssertEqual(self.frame.middle, CGPointMake(self.frame.size.width/2, self.frame.size.height/2))
    }
    
}
