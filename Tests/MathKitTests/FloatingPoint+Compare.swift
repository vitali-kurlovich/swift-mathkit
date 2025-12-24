//
//  FloatingPoint+Compare.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

extension FloatingPoint {
    func isEqual(to other: Self, tolerance: Self) -> Bool {
        // Ensure the tolerance is non-negative
        assert(tolerance >= 0)
        return abs(self - other) <= tolerance
    }
}
