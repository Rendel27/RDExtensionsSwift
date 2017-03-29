//
//  Collection+General.swift
//
//  Created by Giorgi Iashvili on 29.03.17.
//  Copyright (c) 2017 Giorgi Iashvili
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

public extension Collection where Index == Int, Iterator.Element : Collection, Iterator.Element.Index == Int {
    
    /// RDExtensionsSwift: Return element at indexPath
    subscript(indexPath: IndexPath) -> Iterator.Element.Iterator.Element?
    {
        return self.object(at: indexPath)
    }
    
    /// RDExtensionsSwift: Return element at indexPath
    func object(at indexPath: IndexPath) -> Iterator.Element.Iterator.Element?
    {
        if(indexPath.section < Array(self).count && indexPath.row < Array(self[indexPath.section]).count)
        {
            return self[indexPath.section][indexPath.row]
        }
        return nil
    }
    
}

public extension MutableCollection where Index == Int, Iterator.Element : RangeReplaceableCollection, Iterator.Element.Index == Int {
    
    /// RDExtensionsSwift: Remove and return the element at indexPath
    mutating func remove(at indexPath: IndexPath) -> Iterator.Element.Iterator.Element?
    {
        if(indexPath.section < Array(self).count && indexPath.row < Array(self[indexPath.section]).count)
        {
            return self[indexPath.section].remove(at: indexPath.row)
        }
        return nil
    }
    
}
