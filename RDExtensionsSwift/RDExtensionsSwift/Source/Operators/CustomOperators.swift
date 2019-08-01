//
//  CustomOperators.swift
//
//  Created by Giorgi Iashvili on 07.31.19.
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

/// RDExtensionsSwift: Check if nullable lhs is not greater than nullable rhs
precedencegroup NotGreaterThan {
    associativity: left
}
infix operator !> : NotGreaterThan
public func !><T : Comparable>(left: T?, right: T?) -> Bool
{
    return !(left > right)
}

/// RDExtensionsSwift: Check if nullable lhs is not less than nullable rhs
precedencegroup NotLessThan {
    associativity: left
}
infix operator !< : NotLessThan
public func !<<T : Comparable>(left: T?, right: T?) -> Bool
{
    return !(left < right)
}

/// RDExtensionsSwift: Set rhs value to lhs if rhs is not nil
precedencegroup UnwrappedAssign {
    associativity: right
}
infix operator ?= : UnwrappedAssign
public func ?=<T>(base: inout T, newValue: T?)
{
    if let newValue = newValue
    {
        let mirror = Mirror(reflecting: newValue)
        if(mirror.displayStyle != .optional)
        {
            base = newValue
        }
        else if(!mirror.children.isEmpty)
        {
            if let nv = mirror.children.first?.value as? T
            {
                base = nv
            }
        }
    }
}
