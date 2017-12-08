//
//  UIViewController+Init.swift
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

public extension UIViewController {
    
    /// RDExtensionsSwift: Return newly initialized view controller with given id from given storyboard for given bundle
    fileprivate static func _load<T>(with id: String, from storyboard: String, for bundle: Bundle? = nil) -> T?
    {
        return UIStoryboard(name: storyboard, bundle: bundle).instantiateViewController(withIdentifier: id) as? T
    }
    
    /// RDExtensionsSwift: Return newly initialized view controller with given id from given storyboard for given bundle
    static func load(with id: String, from storyboard: String, for bundle: Bundle? = nil) -> Self?
    {
        return self._load(with: id, from: storyboard, for: bundle)
    }
    
    /// RDExtensionsSwift: Return newly initialized view controller with classname as id from given storyboard for given bundle
    static func load(from storyboard: String, for bundle: Bundle? = nil) -> Self?
    {
        return self.load(with: self.className, from: storyboard, for: bundle)
    }
    
    /// RDExtensionsSwift: Return newly initialized view controller with classname as id from given storyboard for given bundle and load as root view controller on given window. If the given window is nil, it will be loaded on the current window
    static func loadAsRootViewController(from storyboard: String, for bundle: Bundle? = nil, on window: UIWindow? = nil) -> Self?
    {
        return self.load(from: storyboard, for: bundle)?.loadAsRootViewController(on: window)
    }
    
    /// RDExtensionsSwift: Load the receiver as root view controller on given window. If the given window is nil, it will be loaded on the current window
    func loadAsRootViewController(on window: UIWindow? = nil) -> Self?
    {
        var w : UIWindow?
        if(window == nil)
        {
            if let window = UIApplication.shared.delegate?.window
            {
                w = window
            }
        }
        w?.rootViewController = self
        w?.makeKeyAndVisible()
        return self
    }
    
}
