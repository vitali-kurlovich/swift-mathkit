//
//  Created by Vitali Kurlovich on 10.01.26.
//

public import MathKit
import CoreGraphics

/// Transform
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

/// Inverse Transform
public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable func inverse(_ point: CGPoint) -> CGPoint {
        .init(inverse(MKPoint(point)))
    }
}

public extension CGPoint {
    @inlinable func applying(_ t: MKAffineTransform<some BinaryFloatingPoint>) -> Self {
        t.transform(self)
    }
}

public extension CGVector {
    @inlinable func applying(_ t: MKAffineTransform<some BinaryFloatingPoint>) -> Self {
        .init(t.transform(MKVector(self)))
    }

    @inlinable func applying(_ t: CGAffineTransform) -> Self {
        applying(MKAffineTransform<CGFloat>(t))
    }
}

public extension CGRect {
    @inlinable func applying(_ t: MKAffineTransform<some BinaryFloatingPoint>) -> Self {
        t.transform(self)
    }
}
