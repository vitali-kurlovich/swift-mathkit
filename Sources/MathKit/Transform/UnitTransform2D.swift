//
//  UnitTransform2D.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

public protocol UnitTransform2D {
    func transform(_ source: UnitPoint) -> CGPoint
}

public protocol InverseUnitTransform2D {
    func inverse(_ source: CGPoint) -> UnitPoint
}
