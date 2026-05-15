//
//  Created by Kurlovich Vitali on 5/15/26.
//

#if canImport(SwiftUI)

    import struct SwiftUI.Angle

    public extension MKAngle {
        @inlinable init(_ angle: Angle) where Float: BinaryFloatingPoint {
            self.init(radians: Float(angle.radians))
        }
    }

    public extension Angle {
        @inlinable init(_ angle: MKAngle<some BinaryFloatingPoint>) {
            self.init(radians: Double(angle.radians))
        }
    }

#endif
