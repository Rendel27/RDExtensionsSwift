//
//  DateTests.swift
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

open class DateTests : XCTestCase {
    
    let date = Date(timeIntervalSince1970: 1474647378.123456)
    let nanoseconds = 123456
    let second = 18
    let minute = 16
    let hour = 20
    let day = 23
    let weekDay = 6
    let weekdayOrdinal = 4
    let month = 9
    let year = 2016
    let era = 1
    
    func testToString()
    {
        XCTAssertEqual(self.date.toString("dd-MM-YY"), "23-09-16")
        XCTAssertEqual(self.date.toString("ss-mm-HH"), "18-16-20")
    }
    
    func testFromString()
    {
        let d1 = Date(formattedString: "01-01-1970", format: "dd-MM-yyyy", timeZone: .utc)
        let d2 = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(d1?.day, d2.day)
        XCTAssertEqual(d1?.month, d2.month)
        XCTAssertEqual(d1?.year, d2.year)
        XCTAssertEqual(self.date.toString("ss-mm-HH"), "18-16-20")
    }
    
    func testTimeIntervalSince1970Milliseconds()
    {
        XCTAssertEqual(self.date.timeIntervalSince1970Milliseconds, 1474647378123)
    }
    
    func testProperties()
    {
//        XCTAssertEqual(self.date.nanosecond, self.nanoseconds)
        XCTAssertEqual(self.date.second, self.second)
        XCTAssertEqual(self.date.minute, self.minute)
        XCTAssertEqual(self.date.hour, self.hour)
        XCTAssertEqual(self.date.day, self.day)
        XCTAssertEqual(self.date.weekDay, self.weekDay)
        XCTAssertEqual(self.date.weekdayOrdinal, self.weekdayOrdinal)
        XCTAssertEqual(self.date.month, self.month)
        XCTAssertEqual(self.date.year, self.year)
        XCTAssertEqual(self.date.era, self.era)
    }
    
    func testDateWithValue()
    {
        let d = Date(nanosecond: self.nanoseconds, second: self.second, minute: self.minute, hour: self.hour, day: self.day, month: self.month, year: self.year, timeZone: TimeZone.current)
//        XCTAssertEqual(self.date.nanosecond, d?.nanosecond)
        XCTAssertEqual(self.date.second, d?.second)
        XCTAssertEqual(self.date.minute, d?.minute)
        XCTAssertEqual(self.date.hour, d?.hour)
        XCTAssertEqual(self.date.day, d?.day)
        XCTAssertEqual(self.date.month, d?.month)
        XCTAssertEqual(self.date.year, d?.year)
        XCTAssertEqual(self.date.year, d?.year)
    }
    
}
