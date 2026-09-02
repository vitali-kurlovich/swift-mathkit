//
//  Created by Kurlovich Vitali on 9/2/26.
//

import CoreGraphics
import MathKit

public struct CGVectorComponents: Hashable, Sendable {
    public var magnitude: CGFloat
    public var rotation: MKAngle<CGFloat>

    @inlinable
    public init(magnitude: CGFloat, rotation: MKAngle<CGFloat>) {
        assert(magnitude >= 0)

        self.magnitude = magnitude
        self.rotation = rotation
    }
}

public extension CGVector {
    @inlinable
    init(magnitude: CGFloat, rotation: MKAngle<CGFloat>) {
        self.init(MKVector(magnitude: magnitude, rotation: rotation))
    }
}

public extension CGVector {
    @inlinable
    init(_ components: CGVectorComponents) {
        self.init(magnitude: components.magnitude, rotation: components.rotation)
    }
}

public extension CGVector {
    @inlinable
    func decomposed() -> CGVectorComponents {
        let comp = MKVector<CGFloat>(self).decomposed()
        return .init(magnitude: comp.magnitude, rotation: comp.rotation)
    }
}
