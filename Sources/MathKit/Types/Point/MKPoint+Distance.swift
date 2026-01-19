//
//  MKPoint+Distance.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 18.01.26.
//

public extension MKPoint {
    @inlinable var magnitudeSquared: Float {
        (x * x).addingProduct(y, y)
    }

    @inlinable var magnitude: Float {
        magnitudeSquared.squareRoot()
    }
}

public extension MKPoint {
    @inlinable func distanceSquared(to target: Self) -> Float {
        (self - target).magnitudeSquared
    }

    @inlinable func distance(to target: Self) -> Float {
        distanceSquared(to: target).squareRoot()
    }
}
