//
//  UIViewController.swift
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

extension UIViewController {
    
    private static func _loadWithId<T>(id: String, storyboard: String) -> T?
    {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewControllerWithIdentifier(id) as? T
    }
    
    public static func loadWithId(id: String, storyboard: String = "Main") -> Self?
    {
        return self._loadWithId(self.className, storyboard: storyboard)
    }
    
    public static func loadFromStoryboard(storyboard: String = "Main") -> Self?
    {
        return self.loadWithId(self.className, storyboard: storyboard)
    }
    
    public static func loadAsRootViewControllerFromStoryboard() -> Self?
    {
        return self.loadFromStoryboard()?.loadAsRootViewController()
    }
    
    public func loadAsRootViewController() -> Self?
    {
        let window = UIApplication.sharedApplication().delegate?.window
        window??.rootViewController = self
        window??.makeKeyAndVisible()
        return self
    }
    
}
