//
//  UITextView+General.swift
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

public extension UITextView {
    
    /// RDExtensionsSwift: Return non nilable text
    var string : String { get { return self.text == nil ? "" : self.text! } set { self.text = newValue } }
    
    /// RDExtensionsSwift: Calculate and return width of the text view for given hight with given font
    var widthForText : CGFloat { return self.string.widthForHeight(self.frame.size.height, font: self.font!) }
    
    /// RDExtensionsSwift: Calculate and return height of the text view for given width with given font
    var heightForText : CGFloat { return self.string.heightForWidth(self.frame.size.width, font: self.font!) }
    
    /// RDExtensionsSwift: Sets attributed text with given components
    func setAttributedText(_ components: [(String, [NSAttributedString.Key: Any])])
    {
        let label = UILabel()
        label.setAttributedText(components)
        self.attributedText = label.attributedText
    }
    
}
