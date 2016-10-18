//
//  UIImageTests.swift
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

open class UIImageTests : XCTestCase {
    
    func testMethods()
    {
        let size1 = CGSize(width: 100, height: 100)
        let size2 = CGSize(width: 50, height: 50)
        let size3 = CGSize(width: 20, height: 20)
        let color = UIColor.green
        let image = UIImage(color: color, size: size1)
        XCTAssertEqual(image.color(CGPoint.zero), color)
        XCTAssertEqual(image.rescale(0.5)?.size, size2)
        XCTAssertEqual(image.resize(size3)?.size, size3)
        XCTAssertEqual(image.changeOrientation(UIImageOrientation.down)?.imageOrientation, UIImageOrientation.down)
    }
    
    func testDownload()
    {
        let expectation = self.expectation(description: "UIImage.testDownload")
        let url = URL(string: "https://avatars3.githubusercontent.com/u/5988751?v=3&s=466")!
        var uuid : String = ""
        uuid = UIImage.download(url, completion: { (image, id) in
            expectation.fulfill()
            XCTAssertEqual(uuid, id)
            XCTAssertNotNil(image)
        })
        
        self.waitForExpectations(timeout: 30) { (error) in
            if(error != nil)
            {
                XCTAssert(false, "Request Timeout for URL: " + url.absoluteString)
            }
        }
    }
    
}
