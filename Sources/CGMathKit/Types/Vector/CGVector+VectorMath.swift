//
//  Created by Kurlovich Vitali on 5/15/26.
//

import CoreGraphics

public import MathKit

public extension CGVector {
    @inlinable func dot(_ other: Self) -> CGFloat {
        MathKit.dot(MKVector(self), MKVector(other))
    }

    @inlinable func cross(_ other: Self) -> CGFloat {
        MathKit.cross(MKVector(self), MKVector(other))
    }
}
