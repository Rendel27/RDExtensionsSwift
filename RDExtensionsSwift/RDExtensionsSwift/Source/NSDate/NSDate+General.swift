//
//  NSDate+General.swift
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

extension NSDate {
    
    /// RDExtensionsSwift: Return current date by local timezone
    public static var localDate : NSDate
    {
        let sourceDate = NSDate()
        let sourceTimeZone = NSTimeZone()
        let destinationTimeZone = NSTimeZone.systemTimeZone()
        let sourceTimeZoneOffset = sourceTimeZone.secondsFromGMTForDate(sourceDate)
        let destinationTimeZoneOffset = destinationTimeZone.secondsFromGMTForDate(sourceDate)
        let interval = NSTimeInterval(destinationTimeZoneOffset - sourceTimeZoneOffset)
        let localDate = NSDate(timeInterval: interval, sinceDate: sourceDate)
        return localDate
    }
    
    /// RDExtensionsSwift: Return date second
    public var second : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Second, fromDate: self).second }
    
    /// RDExtensionsSwift: Return date minute
    public var minute : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Minute, fromDate: self).minute }
    
    /// RDExtensionsSwift: Return date hour
    public var hour : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: self).hour }
    
    /// RDExtensionsSwift: Return date day
    public var day : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: self).day }
    
    /// RDExtensionsSwift: Return date week day
    public var weekDay : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Weekday, fromDate: self).weekday }
    
    /// RDExtensionsSwift: Return date ordinal week day
    public var weekdayOrdinal : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.WeekdayOrdinal, fromDate: self).weekdayOrdinal }
    
    /// RDExtensionsSwift: Return date month
    public var month : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Month, fromDate: self).month }
    
    /// RDExtensionsSwift: Return date year
    public var year : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: self).year }
    
    /// RDExtensionsSwift: Return date era
    public var era : Int { return NSCalendar.currentCalendar().components(NSCalendarUnit.Era, fromDate: self).era }
    
}
