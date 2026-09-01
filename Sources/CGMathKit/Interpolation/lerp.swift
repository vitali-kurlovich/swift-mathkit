//
//  Created by Kurlovich Vitali on 9/2/26.
//

import CoreGraphics
import MathKit

@inlinable
public func lerp(_ v0: CGPoint, _ v1: CGPoint, t: CGFloat) -> CGPoint {
    .init(x: lerp(v0.x, v1.x, t: t),
          y: lerp(v0.y, v1.y, t: t))
}

@inlinable public func lerp(_ v0: CGVector, _ v1: CGVector, t: CGFloat) -> CGVector {
    CGVector(dx: lerp(v0.dx, v1.dx, t: t), dy: lerp(v0.dy, v1.dy, t: t))
}
