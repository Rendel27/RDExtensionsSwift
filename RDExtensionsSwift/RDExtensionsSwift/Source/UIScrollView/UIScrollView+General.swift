//
//  UIScrollView+General.swift
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

public extension UIScrollView {
    
    var contentWidth : CGFloat { get { return self.contentSize.width } set { self.contentSize = CGSizeMake(newValue, self.contentSize.height) } }
    var contentHeight : CGFloat { get { return self.contentSize.height } set { self.contentSize = CGSizeMake(self.contentSize.width, newValue) } }
    
    var scrolledTop : Bool { return self.contentOffset.y < 0 }
    var scrolledBottom : Bool { return self.contentOffset.y >= (self.contentSize.height - self.frame.size.height) }
    
    func scrollToTop(animated: Bool = true)
    {
        self.setContentOffset(CGPointZero, animated: animated)
    }
    
    func scrollToBottom(animated: Bool = true)
    {
        self.setContentOffset(CGPointMake(0, max(self.contentSize.height - self.bounds.size.height + self.contentInset.bottom, 0)), animated: animated)
    }
    
}
