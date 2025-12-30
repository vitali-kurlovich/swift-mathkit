//
//  CGVector.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

public typealias CGVector = Foundation.CGVector

#if !canImport(CoreGraphics)

    extension CGVector: @retroactive Equatable, Sendable {
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.dx == rhs.dx && lhs.dy == rhs.dy
        }
    }

    extension CGVector: @retroactive Hashable {
        public func hash(into hasher: inout Hasher) {
            dx.hash(into: &hasher)
            dy.hash(into: &hasher)
        }
    }

#endif // !canImport(CoreGraphics)
