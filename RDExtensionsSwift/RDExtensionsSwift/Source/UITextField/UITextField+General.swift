//
//  UITextField+General.swift
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

public extension UITextField {
    
    /// RDExtensionsSwift: Return non nilable text
    var string : String { get { return self.text == nil ? "" : self.text! } set { self.text = newValue } }
    
    /// RDExtensionsSwift: Calculate and return width of the text field for given hight with given font
    var widthForText : CGFloat { return self.string.widthForHeight(self.frame.size.height, font: self.font!) }
    
    /// RDExtensionsSwift: Calculate and return height of the text field for given width with given font
    var heightForText : CGFloat { return self.string.heightForWidth(self.frame.size.width, font: self.font!) }
    
    /// RDExtensionsSwift: Add did change text handler to the delegate
    func addDidChangeTextHandler()
    {
        if(self.delegate?.responds(to: Selector(("textFieldDidChangeText:"))) == true)
        {
            self.addTarget(self.delegate, action: Selector(("textFieldDidChangeText:")), for: UIControl.Event.editingChanged)
        }
    }
    
    /// RDExtensionsSwift: Return true if the text field is last in queue. Else return false
    func textFieldReturnedFromQueue(_ queue: [UITextField]) -> Bool
    {
        self.resignFirstResponder()
        
        for i in 0 ..< queue.count
        {
            if(i + 1 == queue.count)
            {
                return true
            }
            
            if(queue[i] == self)
            {
                queue[i + 1].becomeFirstResponder()
                return false
            }
        }
        
        return false
    }
    
    /// RDExtensionsSwift: Set cursor at given index
    func setCursor(at index: Int)
    {
        if let position = self.position(from: beginningOfDocument, offset: index)
        {
            self.selectedTextRange = self.textRange(from: position, to: position)
        }
    }
    
    /// RDExtensionsSwift: Placeholder color
    var placeHolderColor: UIColor?
    {
        get { return self.attributedPlaceholder?.attribute(.foregroundColor, at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: self.attributedPlaceholder?.length ?? 0)) as? UIColor }
        set
        {
            if(newValue != nil)
            {
                let attributedText = self.attributedPlaceholder == nil ? NSMutableAttributedString(string: self.placeholder ?? "") : NSMutableAttributedString(attributedString: self.attributedPlaceholder!)
                attributedText.addAttribute(.foregroundColor, value: newValue!, range: NSRange(location: 0, length: attributedText.length))
                self.attributedPlaceholder = attributedText
            }
        }
    }
    
    /// RDExtensionsSwift: Placeholder font
    var placeHolderFont: UIFont?
    {
        get { return self.attributedPlaceholder?.attribute(.font, at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: self.attributedPlaceholder?.length ?? 0)) as? UIFont }
        set
        {
            if(newValue != nil)
            {
                let attributedText = self.attributedPlaceholder == nil ? NSMutableAttributedString(string: self.placeholder ?? "") : NSMutableAttributedString(attributedString: self.attributedPlaceholder!)
                attributedText.addAttribute(.font, value: newValue!, range: NSRange(location: 0, length: attributedText.length))
                self.attributedPlaceholder = attributedText
            }
        }
    }
    
    /// RDExtensionsSwift: Sets attributed text with given components
    func setAttributedText(_ components: [(String, [NSAttributedString.Key: Any])])
    {
        let label = UILabel()
        label.setAttributedText(components)
        self.attributedText = label.attributedText
    }
    
}

public extension UITextFieldDelegate {
    
    /// RDExtensionsSwift: Tells the delegate that text did change in the specified text field
    func textFieldDidChangeText(_ textField: UITextField)
    {
        
    }
    
}
