//
//  Created by Kurlovich Vitali on 5/15/26.
//

#if canImport(CoreGraphics)

    import struct CoreFoundation.CGFloat
    import struct CoreGraphics.CGVector

    public extension CGVector {
        @inlinable
        mutating func rotate(_ angle: MKAngle<Double>) {
            self = .init(MKVector(self).rotated(angle))
        }

        @inlinable
        func rotated(_ angle: MKAngle<Double>) -> Self {
            .init(MKVector(self).rotated(angle))
        }

        @inlinable
        mutating func rotate(_ angle: MKAngle<Float>) {
            self = .init(MKVector(self).rotated(angle))
        }

        @inlinable
        func rotated(_ angle: MKAngle<Float>) -> Self {
            .init(MKVector(self).rotated(angle))
        }

        @inlinable
        mutating func rotate(_ angle: MKAngle<CGFloat>) {
            self = .init(MKVector(self).rotated(angle))
        }

        @inlinable
        func rotated(_ angle: MKAngle<CGFloat>) -> Self {
            .init(MKVector(self).rotated(angle))
        }

        @inlinable
        mutating func rotate(_ angle: MKAngle<Float16>) {
            self = .init(MKVector(self).rotated(angle))
        }

        @inlinable
        func rotated(_ angle: MKAngle<Float16>) -> Self {
            .init(MKVector(self).rotated(angle))
        }
    }

#endif // canImport(CoreGraphics)

#if canImport(SwiftUI)

    import struct SwiftUI.Angle

    public extension CGVector {
        @inlinable
        mutating func rotate(_ angle: Angle) {
            let angle = MKAngle<Double>(angle)

            rotate(angle)
        }

        @inlinable
        func rotated(_ angle: Angle) -> Self {
            let angle = MKAngle<Double>(angle)

            return rotated(angle)
        }
    }

#endif
