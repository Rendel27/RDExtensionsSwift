//
//  Date+Conversion.swift
//
//  Created by Giorgi Iashvili on 19.09.16.
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

public extension Date {
    
    /// RDExtensionsSwift: Convert NSDate to String with given format and given time zone
    func toString(_ format: String, locale: Locale? = nil, timeZone: TimeZone? = nil) -> String
    {
        let df = DateFormatter()
        df.dateFormat = format
        if let locale = locale
        {
            df.locale = locale
        }
        if let tz = timeZone
        {
            df.timeZone = tz
        }
        return df.string(from: self)
    }
    
    /// RDExtensionsSwift: The milliseconds interval between the date object and 00:00:00 UTC on 1 January 1970.
    var timeIntervalSince1970Milliseconds : Int64 { get { return (self.timeIntervalSince1970 * 1000).toInt64 } }
    
}
