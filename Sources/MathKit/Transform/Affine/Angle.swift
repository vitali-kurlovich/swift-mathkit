//
//  Angle.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

#if canImport(SwiftUI)
    import SwiftUI

    public typealias Angle = SwiftUI.Angle
#else

    @frozen public struct Angle {
        public var radians: Double

        @inlinable public var degrees: Double {
            radians * (Double.pi / 180)
        }

        @inlinable public init() {
            self.init(radians: 0)
        }

        @inlinable public init(radians: Double) {
            self.radians = radians
        }

        @inlinable public init(degrees: Double) {
            self.init(radians: degrees * (180 / Double.pi))
        }

        @inlinable public static func radians(_ radians: Double) -> Angle {
            .init(radians: radians)
        }

        @inlinable public static func degrees(_ degrees: Double) -> Angle {
            .init(degrees: degrees)
        }
    }

#endif
