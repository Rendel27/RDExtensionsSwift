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

public extension Collection {
    
    /// RDExtensionsSwift: Projects each element of a sequence
    func lambda(expressions: @escaping  ((Iterator.Element) -> Void))
    {
        for element in self
        {
            expressions(element)
        }
    }
    
    /// RDExtensionsSwift: Returns object at given index
    func object(at index: Index) -> Element?
    {
        return self.indices.contains(index) ? self[index] : nil
    }
    
    /// RDExtensionsSwift: Return indexes of elements that conforms to block
    func indexes(for block: @escaping (Element) -> Bool) -> [Int]
    {
        var indexes: [Int] = []
        var index = 0
        for element in self
        {
            if(block(element))
            {
                indexes.append(index)
            }
            index += 1
        }
        return indexes
    }
    
    /// RDExtensionsSwift: Enumerated Map with element and index
    func enumeratedMap<T>(transform: @escaping (Element, Int) -> T) -> [T]
    {
        var items: [T] = []
        var index = 0
        for item in self
        {
            items.append(transform(item, index))
            index += 1
        }
        return items
    }
    
    /// RDExtensionsSwift: Iterable For Each with element and index
    func iterableForEach(_ body: @escaping (Element) -> Void)
    {
        self.iterableForEach { item, _ in
            body(item)
        }
    }
    
    /// RDExtensionsSwift: Iterable For Each with element and index
    func iterableForEach(_ body: @escaping (Element, Int) -> Void)
    {
        var index = 0
        for item in self
        {
            body(item, index)
            index += 1
        }
    }
    
    /// RDExtensionsSwift: Returns a collection containing all but the elements that conform the closure
    func removing(_ body: @escaping (Element) -> Bool) -> Self
    {
        return self.removing { item, _ in
            return body(item)
        }
    }
    
    /// RDExtensionsSwift: Returns a collection containing all but the elements that conform the closure
    func removing(_ body: @escaping (Element, Int) -> Bool) -> Self
    {
        var collection: [Element] = []
        var index = 0
        for item in self
        {
            if(!body(item, index))
            {
                collection.append(item)
            }
            index += 1
        }
        return collection as! Self
    }
    
    /// RDExtensionsSwift: Removes all elements that conform the closure
    mutating func remove(_ body: @escaping (Element) -> Bool)
    {
        self.remove { item, _ in
            return body(item)
        }
    }
    
    /// RDExtensionsSwift: Removes all elements that conform the closure
    mutating func remove(_ body: @escaping (Element, Int) -> Bool)
    {
        self = self.removing(body)
    }
    
    /// RDExtensionsSwift: Returns collection with subcollections including splitted elements
    func split(maxLength: Int) -> [[Element]]
    {
        return self.count <= maxLength ? [Array(self)] : [Array(Array(self)[0 ..< maxLength])] + Array(Array(self)[maxLength ..< self.count]).split(maxLength: maxLength)
    }
    
}

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

public extension Collection where Element : Equatable {
    
    /// RDExtensionsSwift: Returns a collection with unique elements
    func uniques() -> [Element]
    {
        var elements: [Element] = []
        self.iterableForEach { element in
            if(!elements.contains(element))
            {
                elements.append(element)
            }
        }
        return elements
    }
    
}
