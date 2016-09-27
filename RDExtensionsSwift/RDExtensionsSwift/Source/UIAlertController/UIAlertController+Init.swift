//
//  UIAlertController+Init.swift
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

public extension UIAlertController {
    
    /// RDExtensionsSwift: Return a newly initialized view controller for displaying an alert to the user
    convenience init(title: String? = nil, message: String, style : UIAlertControllerStyle = .Alert, inputFieldPlaceholders: [String] = [], actionTitles: [String], actionBlocks: [((UIAlertAction) -> Void)?], completion: (() -> Void)? = nil)
    {
        self.init(title: title, message: message, preferredStyle: style)
        var actionBlocks = actionBlocks
        for tfph in inputFieldPlaceholders
        {
            self.addTextFieldWithConfigurationHandler { (tf) -> Void in
                tf.placeholder = tfph
            }
        }
        for i in 0 ..< actionTitles.count
        {
            if(i > actionBlocks.count - 1)
            {
                actionBlocks.append(nil)
            }
            self.addAction(UIAlertAction(title: actionTitles[i], style: .Default, handler: actionBlocks[i]))
        }
    }
    
}
