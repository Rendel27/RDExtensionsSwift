//
//  RawRepresentable+General.swift
//
//  Created by Giorgi Iashvili on 12.03.17.
//  Copyright (c) 2017 Giorgi Iashvili
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

public extension RawRepresentable {
    
    /// RDExtensionsSwift: Return the name of the raw represantable element
    var toString : String { get { return "\(self)" } }
    
}

public extension RawRepresentable where Self: Collectable {
    
    /// RDExtensionsSwift: Return key value array of enum elements
    static var keyValueArray : [(key: String, value: RawValue)]
    {
        get
        {
            var array : [(String, RawValue)] = []
            for item in self.items
            {
                array.append((item.toString, item.rawValue))
            }
            return array
        }
    }
    
}

public extension RawRepresentable where Self: Collectable, Self: Describable {
    
    /// RDExtensionsSwift: Return key value description array of enum elements
    static var keyValueDescriptionArray : [(key: String, value: RawValue, description: String)]
    {
        get
        {
            var array : [(String, RawValue, String)] = []
            for item in self.items
            {
                array.append((item.toString, item.rawValue, item.description))
            }
            return array
        }
    }
    
}