//
//  NSData+Init.swift
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

extension NSData {
    
    /// RDExtensionsSwift: Return unique identifier and download data from the given url
    public static func download(url: NSURL, completeInMainThread: Bool = true, completion: ((data: NSData?, id: String) -> Void)?) -> String
    {
        let id = String.UUID
        dispatch_async(dispatch_queue_create(id, DISPATCH_QUEUE_CONCURRENT), {
            let data = NSData(contentsOfURL: url)
            if(completeInMainThread)
            {
                dispatch_async(dispatch_get_main_queue(), {
                    completion?(data: data, id: id)
                })
            }
            else
            {
                completion?(data: data, id: id)
            }
        })
        return id
    }
    
}
