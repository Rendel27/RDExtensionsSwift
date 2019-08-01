//
//  CLLocationCoordinate2D+General.swift
//
//  Created by Giorgi Iashvili on 08.01.19.
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

import CoreLocation

public extension CLLocationCoordinate2D {
    
    /// RDExtensionsSwift: The coordinates with 0 latitude and 0 longitude
    static var zero: CLLocationCoordinate2D { get { return CLLocationCoordinate2D(latitude: 0, longitude: 0) } }
    
    /// RDExtensionsSwift: Returns distance between the receiver and the given coordinates using Haversine Formula. Note: result is given in meters.
    func distance(from coordinate: CLLocationCoordinate2D) -> Double
    {
        let lat1rad = self.latitude * Double.pi/180
        let lon1rad = self.longitude * Double.pi/180
        let lat2rad = coordinate.latitude * Double.pi/180
        let lon2rad = coordinate.longitude * Double.pi/180
        
        let dLat = lat2rad - lat1rad
        let dLon = lon2rad - lon1rad
        let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1rad) * cos(lat2rad)
        let c = 2 * asin(sqrt(a))
        let R = 6372.8
        
        return R * c * 1000
    }
    
}
