//
//  Created by Kurlovich Vitali on 5/15/26.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public extension CGVector {
        @inlinable func dot(_ other: Self) -> CGFloat {
            MathKit.dot(MKVector(self), MKVector(other))
        }

        @inlinable func cross(_ other: Self) -> CGFloat {
            MathKit.cross(MKVector(self), MKVector(other))
        }
    }

#endif // canImport(CoreGraphics)
