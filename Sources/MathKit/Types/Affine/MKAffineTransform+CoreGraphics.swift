//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

// Transform
public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable func transform(_ point: CGPoint) -> CGPoint {
        .init(transform(MKPoint(point)))
    }
}

public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable func transform(_ rect: CGRect) -> CGRect {
        .init(transform(MKRect(rect)))
    }
}

// Inverse Transform
public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable func inverse(_ point: CGPoint) -> CGPoint {
        .init(inverse(MKPoint(point)))
    }
}

public extension CGPoint {
    @inlinable func applying<Float>(_ t: MKAffineTransform<Float>) -> Self where Float: BinaryFloatingPoint {
        t.transform(self)
    }
}

public extension CGRect {
    @inlinable func applying<Float>(_ t: MKAffineTransform<Float>) -> Self where Float: BinaryFloatingPoint {
        t.transform(self)
    }
}
