//
//  Array+General.swift
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

public extension Array {
    
    mutating func remove <U: Equatable> (object: U)
    {
        if(self.count == 0)
        {
            return
        }
        
        var i = 0
        while(i < self.count)
        {
            if let element = self[i] as? U
            {
                if(element == object)
                {
                    self.removeAtIndex(i)
                    i -= 1
                }
            }
            i += 1
        }
    }
    
    mutating func insertContentsOf(newElements: [Element], atIndex: Int)
    {
        for e in newElements.reverse()
        {
            self.insert(e, atIndex: 0)
        }
    }
    
}

public extension Array where Element : _ArrayType {
    
    subscript(indexPath: NSIndexPath) -> Element.Generator.Element?
    {
        if(indexPath.section < self.count && indexPath.row < self[indexPath.section].count)
        {
            return self[indexPath.section][indexPath.row]
        }
        return nil
    }
    
    mutating func removeAtIndexPath(indexPath: NSIndexPath) -> Element.Generator.Element?
    {
        if(indexPath.section < self.count && indexPath.row < self[indexPath.section].count)
        {
            return self[indexPath.section].removeAtIndex(indexPath.row)
        }
        return nil
    }
    
}
