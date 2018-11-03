//
//  UIView+General.swift
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
    
    /// RDExtensionsSwift: Return subviews of the receiver by given tag recursively
    func subviews(_ tag: Int? = nil, recursively: Bool = false) -> [UIView]
    {
        var arraySubviews : [UIView] = []
        for view in self.subviews
        {
            if let t = tag
            {
                if(view.tag == t)
                {
                    arraySubviews.append(view)
                }
            }
            else
            {
                arraySubviews.append(view)
            }
            
            if(recursively)
            {
                arraySubviews += view.subviews(tag, recursively: recursively)
            }
        }
        return arraySubviews
    }
    
    /// RDExtensionsSwift: Return subviews of the receiver of given kind
    func subviews(kindOf: UIView.Type) -> [UIView]
    {
        var arraySubviews : [UIView] = []
        for view in self.subviews
        {
            if(view.isKind(of: kindOf))
            {
                arraySubviews.append(view)
            }
            else
            {
                arraySubviews.append(view)
            }
            
            arraySubviews += view.subviews(kindOf: kindOf)
        }
        return arraySubviews
    }
    
    /// RDExtensionsSwift: Remove all subviews of the receiver
    func removeAllSubviews()
    {
        for sv in self.subviews
        {
            sv.removeFromSuperview()
        }
    }
    
}
