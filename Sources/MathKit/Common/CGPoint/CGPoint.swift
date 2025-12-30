//
//  CGPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

public typealias CGPoint = Foundation.CGPoint

#if !canImport(CoreGraphics)

    extension CGPoint: @retroactive Equatable, Sendable {
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.x == rhs.x && lhs.y == rhs.y
        }
    }

    extension CGPoint: @retroactive Hashable {
        public func hash(into hasher: inout Hasher) {
            x.hash(into: &hasher)
            y.hash(into: &hasher)
        }
    }

#endif // !canImport(CoreGraphics)
