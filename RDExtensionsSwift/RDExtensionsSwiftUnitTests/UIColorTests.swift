//
//  UIColorTests.swift
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

public class UIColorTests : XCTestCase {
    
    func testProperties()
    {
        let color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        XCTAssertEqual(color.red, 0.5)
        XCTAssertEqual(color.green, 0.5)
        XCTAssertEqual(color.blue, 0.5)
        XCTAssertEqual(color.alpha, 0.5)
    }
    
    func testInit()
    {
        let color = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 155.0/255)
        XCTAssertEqual(UIColor(red: 155, green: 155, blue: 155, alpha: 155), color)
        XCTAssertEqual(UIColor(hexValue: 0x9b9b9b, alpha: 155), color)
        XCTAssertEqual(UIColor(hexString: "#9b9b9b", alpha: 155), color)
    }
    
}
