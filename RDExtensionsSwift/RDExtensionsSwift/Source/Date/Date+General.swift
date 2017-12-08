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

public extension Date {
    
    /// RDExtensionsSwift: Return date nanosecond
    var nanosecond : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.nanosecond, from: self).nanosecond! }
    
    /// RDExtensionsSwift: Return date second
    var second : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.second, from: self).second! }
    
    /// RDExtensionsSwift: Return date minute
    var minute : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.minute, from: self).minute! }
    
    /// RDExtensionsSwift: Return date hour
    var hour : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.hour, from: self).hour! }
    
    /// RDExtensionsSwift: Return date day
    var day : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.day, from: self).day! }
    
    /// RDExtensionsSwift: Return date week day
    var weekDay : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.weekday, from: self).weekday! }
    
    /// RDExtensionsSwift: Return date ordinal week day
    var weekdayOrdinal : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.weekdayOrdinal, from: self).weekdayOrdinal! }
    
    /// RDExtensionsSwift: Return date month
    var month : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.month, from: self).month! }
    
    /// RDExtensionsSwift: Return date year
    var year : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.year, from: self).year! }
    
    /// RDExtensionsSwift: Return date era
    var era : Int { return (Calendar.current as NSCalendar).components(NSCalendar.Unit.era, from: self).era! }
    
}
