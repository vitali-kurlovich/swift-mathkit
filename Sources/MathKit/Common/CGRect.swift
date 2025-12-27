//
//  CGRect.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

public typealias CGRect = Foundation.CGRect

#if !canImport(CoreGraphics)

    extension CGRect: @retroactive Equatable, @retroactive Hashable {
        public static func == (lhs: CGRect, rhs: CGRect) -> Bool {
            lhs.origin == rhs.origin && lhs.size == rhs.size
        }

        public func hash(into hasher: inout Hasher) {
            origin.hash(into: &hasher)
            size.hash(into: &hasher)
        }
    }

#endif // !canImport(CoreGraphics)
