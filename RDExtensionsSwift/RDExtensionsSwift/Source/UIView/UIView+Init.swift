//
//  UIView+Init.swift
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

public extension UIView {
    
    /// RDExtensionsSwift: Return newly initialized view by given name for given owner with given options
    fileprivate static func _load<T>(with name: String, for owner: Any? = self, with options: [UINib.OptionsKey : Any]? = nil) -> T?
    {
        if let views = Bundle.main.loadNibNamed(name, owner: owner, options: options)
        {
            for view in views
            {
                if view is T
                {
                    return view as? T
                }
            }
        }
        return nil
    }
    
    /// RDExtensionsSwift: Return newly initialized view by given name for given owner with given options
    static func load(with name: String, for owner: Any? = nil, with options: [UINib.OptionsKey : Any]? = nil) -> Self?
    {
        return self._load(with: name, for: owner, with: options)
    }
    
    /// RDExtensionsSwift: Return newly initialized view with classname as id for given owner with given options
    static func load(for owner: Any? = nil, with options: [UINib.OptionsKey : Any]? = nil) -> Self?
    {
        return self.load(with: self.className, for: owner, with: options)
    }
    
}
