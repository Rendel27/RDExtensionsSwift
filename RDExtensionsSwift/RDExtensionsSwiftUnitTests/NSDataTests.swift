//
//  NSDataTests.swift
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

open class NSDataTests : XCTestCase {
    
    func testDownload()
    {
        let expectation = self.expectation(description: "NSData.testDownload")
        let url = URL(string: "https://avatars3.githubusercontent.com/u/5988751?v=3&s=466")!
        var uuid : String = ""
        uuid = Data.download(url, completion: { (data, id) in
            expectation.fulfill()
            XCTAssertEqual(uuid, id)
            XCTAssertNotNil(data)
        })
        
        self.waitForExpectations(timeout: 30) { (error) in
            if(error != nil)
            {
                XCTAssert(false, "Request Timeout for URL: " + url.absoluteString)
            }
        }
    }
    
}
