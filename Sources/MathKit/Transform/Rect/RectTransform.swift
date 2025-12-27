//
//  RectTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

public struct RectTransform {
    private let origin: CGPoint
    private let size: CGSize

    private let invWidth: CGFloat
    private let invHeight: CGFloat

    public init(_ frame: CGRect) {
        assert(frame.size != .zero)

        origin = frame.origin
        size = frame.size

        invWidth = 1.0 / frame.size.width
        invHeight = 1.0 / frame.size.height
    }
}

public extension RectTransform {
    var frame: CGRect {
        .init(origin: origin, size: size)
    }
}

extension RectTransform: UnitTransform2D {
    public func transform(_ source: UnitPoint) -> CGPoint {
        let x = origin.x.addingProduct(source.x, size.width)
        let y = origin.y.addingProduct(source.y, size.height)
        return .init(x: x, y: y)
    }
}

extension RectTransform: InverseUnitTransform2D {
    public func inverse(_ source: CGPoint) -> UnitPoint {
        let x = (source.x - origin.x) * invWidth
        let y = (source.y - origin.y) * invHeight
        return .init(x: x, y: y)
    }
}
