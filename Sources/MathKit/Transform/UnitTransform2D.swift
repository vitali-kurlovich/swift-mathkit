//
//  UnitTransform2D.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

public protocol UnitTransform2D {
    func transform(_ source: UnitPoint) -> CGPoint
}

public protocol InverseUnitTransform2D {
    func inverse(_ source: CGPoint) -> UnitPoint
}

public protocol Transform2D {
    func transform(_ source: CGPoint) -> CGPoint
}

public protocol InverseTransform2D {
    func inverse(_ source: CGPoint) -> CGPoint
}
