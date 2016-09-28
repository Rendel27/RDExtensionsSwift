//
//  OperatorOverloads.swift
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

// MARK: Overload opertors for Int and CGFloat

/// RDExtensionsSwift: Int + CGFloat without conversions
public func +(left: Int, right: CGFloat) -> CGFloat
{
    return CGFloat(left) + right
}

/// RDExtensionsSwift: CGFloat + Int without conversions
public func +(left: CGFloat, right: Int) -> CGFloat
{
    return left + CGFloat(right)
}

/// RDExtensionsSwift: Int - CGFloat without conversions
public func -(left: Int, right: CGFloat) -> CGFloat
{
    return CGFloat(left) - right
}

/// RDExtensionsSwift: CGFloat - Int without conversions
public func -(left: CGFloat, right: Int) -> CGFloat
{
    return left - CGFloat(right)
}

/// RDExtensionsSwift: Int * CGFloat without conversions
public func *(left: Int, right: CGFloat) -> CGFloat
{
    return CGFloat(left) * right
}

/// RDExtensionsSwift: CGFloat * Int without conversions
public func *(left: CGFloat, right: Int) -> CGFloat
{
    return left * CGFloat(right)
}

/// RDExtensionsSwift: Int / CGFloat without conversions
public func /(left: Int, right: CGFloat) -> CGFloat
{
    return CGFloat(left) / right
}

/// RDExtensionsSwift: CGFloat / Int without conversions
public func /(left: CGFloat, right: Int) -> CGFloat
{
    return left / CGFloat(right)
}

// MARK: Overload opertors for Int and Float

/// RDExtensionsSwift: Int + Float without conversions
public func +(left: Int, right: Float) -> Float
{
    return Float(left) + right
}

/// RDExtensionsSwift: Float + Int without conversions
public func +(left: Float, right: Int) -> Float
{
    return left + Float(right)
}

/// RDExtensionsSwift: Int - Float without conversions
public func -(left: Int, right: Float) -> Float
{
    return Float(left) - right
}

/// RDExtensionsSwift: Float - Int without conversions
public func -(left: Float, right: Int) -> Float
{
    return left - Float(right)
}

/// RDExtensionsSwift: Int * Float without conversions
public func *(left: Int, right: Float) -> Float
{
    return Float(left) * right
}

/// RDExtensionsSwift: Float * Int without conversions
public func *(left: Float, right: Int) -> Float
{
    return left * Float(right)
}

/// RDExtensionsSwift: Int / Float without conversions
public func /(left: Int, right: Float) -> Float
{
    return Float(left) / right
}

/// RDExtensionsSwift: Float / Int without conversions
public func /(left: Float, right: Int) -> Float
{
    return left / Float(right)
}

// MARK: Overload opertors for Int and Double

/// RDExtensionsSwift: Int + Double without conversions
public func +(left: Int, right: Double) -> Double
{
    return Double(left) + right
}

/// RDExtensionsSwift: Double + Int without conversions
public func +(left: Double, right: Int) -> Double
{
    return left + Double(right)
}

/// RDExtensionsSwift: Int - Double without conversions
public func -(left: Int, right: Double) -> Double
{
    return Double(left) - right
}

/// RDExtensionsSwift: Double - Int without conversions
public func -(left: Double, right: Int) -> Double
{
    return left - Double(right)
}

/// RDExtensionsSwift: Int * Double without conversions
public func *(left: Int, right: Double) -> Double
{
    return Double(left) * right
}

/// RDExtensionsSwift: Double * Int without conversions
public func *(left: Double, right: Int) -> Double
{
    return left * Double(right)
}

/// RDExtensionsSwift: Int / Double without conversions
public func /(left: Int, right: Double) -> Double
{
    return Double(left) / right
}

/// RDExtensionsSwift: Double / Int without conversions
public func /(left: Double, right: Int) -> Double
{
    return left / Double(right)
}

// MARK: Overload opertors for Arrays

/// RDExtensionsSwift: Append rhs to lhs
public func +=(inout left: [NSObject], right: [NSObject])
{
    left = left + right
}
