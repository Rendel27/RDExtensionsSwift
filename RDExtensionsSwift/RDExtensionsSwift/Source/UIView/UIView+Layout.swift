//
//  UIView+Layout.swift
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
    
    /// RDExtensionsSwift: Stretch the receiver to the given view(subview, if not presented) by given edge insets
    func stretchLayout(_ view: UIView? = nil, edgeInsets: UIEdgeInsets = UIEdgeInsets.zero)
    {
        if let sv = self.superview, let v = (view ?? self.superview)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            sv.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1, constant: edgeInsets.left))
            sv.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: v, attribute: .trailing, multiplier: 1, constant: edgeInsets.right))
            sv.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1, constant: edgeInsets.top))
            sv.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: v, attribute: .bottom, multiplier: 1, constant: edgeInsets.bottom))
        }
    }
    
    /// RDExtensionsSwift: Return an array containing constraints by given identifier
    func constraints(_ identifier: String) -> [NSLayoutConstraint]
    {
        var cs : [NSLayoutConstraint] = []
        for c in self.constraints
        {
            if(c.identifier == identifier)
            {
                cs.append(c)
            }
        }
        return cs
    }
    
}
