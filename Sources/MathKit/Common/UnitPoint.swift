//
//  UnitPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

#if canImport(SwiftUI)
    import struct SwiftUI.UnitPoint

    public typealias UnitPoint = SwiftUI.UnitPoint

#else

    import struct CoreFoundation.CGFloat

    public struct UnitPoint: Hashable {
        public var x: CGFloat
        public var y: CGFloat

        public init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }

    public extension UnitPoint {
        static var center: UnitPoint { UnitPoint(x: 0.5, y: 0.5) }
    }

#endif // canImport(SwiftUI)
