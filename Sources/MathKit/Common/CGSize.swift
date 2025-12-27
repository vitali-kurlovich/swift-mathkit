//
//  CGSize.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

public typealias CGSize = Foundation.CGSize

#if !canImport(CoreGraphics)

    extension CGSize: @retroactive Equatable, @retroactive Hashable {
        public static func == (lhs: CGSize, rhs: CGSize) -> Bool {
            lhs.width == rhs.width && lhs.height == rhs.height
        }

        public func hash(into hasher: inout Hasher) {
            width.hash(into: &hasher)
            height.hash(into: &hasher)
        }
    }

#endif // !canImport(CoreGraphics)
