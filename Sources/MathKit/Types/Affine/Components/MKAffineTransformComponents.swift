//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation

public struct MKAffineTransformComponents<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    @inlinable
    public init(translation: MKVector<Float> = .zero, rotation: MKAngle<Float> = .zero, scale: MKSize<Float> = .identity) {
        self.translation = translation
        self.scale = scale
        self.rotation = rotation
    }

    public var translation: MKVector<Float>
    public var scale: MKSize<Float>
    public var rotation: MKAngle<Float>
}

public extension MKAffineTransformComponents {
    @inlinable static var zero: Self { .init() }
}
