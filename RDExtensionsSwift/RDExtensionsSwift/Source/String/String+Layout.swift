//
//  String+Layout.swift
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

public extension String {
    
    /// RDExtensionsSwift: Calculate and return width of the string for given hight with given font
    func widthForHeight(_ height: CGFloat, font: UIFont) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.frame.size.width
    }
    
    /// RDExtensionsSwift: Calculate and return height of the string for given width with given font
    func heightForWidth(_ width: CGFloat, font: UIFont) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.frame.size.height
    }
    
    /// RDExtensionsSwift: Calculate and return font size of the string for given width, height and font name
    func fontSizeFor(width: CGFloat, height: CGFloat, fontName: String) -> CGFloat
    {
        var fontSize = 0 as CGFloat
        var w = 0 as CGFloat
        while(w < width)
        {
            w = self.widthForHeight(height, font: UIFont(name: fontName, size: fontSize)!)
            fontSize += 1
        }
        return fontSize - 1
    }
    
    /// RDExtensionsSwift: Calculate and return font size of the attributed string for given width, height and font name
    func attributedFontSizeFor(width: CGFloat, height: CGFloat, fontName: String) -> CGFloat
    {
        var fontSize = 0 as CGFloat
        var w = 0 as CGFloat
        while(w < width)
        {
            fontSize += 1
            let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: height))
            textView.text = self
            textView.font = UIFont(name: fontName, size: fontSize)
            textView.sizeToFit()
            w = textView.frame.width
        }
        return fontSize - 1
    }
    
}
