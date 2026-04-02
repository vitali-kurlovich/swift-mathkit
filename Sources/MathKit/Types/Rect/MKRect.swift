//
//  MKRect.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public nonisolated struct MKRect<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var origin: MKPoint<Float>
    public var size: MKSize<Float>

    @inlinable public init(origin: MKPoint<Float>, size: MKSize<Float>) {
        self.origin = origin
        self.size = size
    }
}

public extension MKRect {
    @inlinable init() {
        self.init(origin: .zero, size: .zero)
    }

    @inlinable init(x: Float, y: Float, width: Float, height: Float) {
        self.init(origin: .init(x: x, y: y), size: .init(width: width, height: height))
    }

    @inlinable static var zero: Self {
        .init()
    }

    @inlinable static var identity: Self {
        .init(origin: .zero, size: .identity)
    }
}

public extension MKRect {
    @inlinable var aspectRatio: Float {
        size.aspectRatio
    }
}

public extension MKRect {
    @inlinable var center: MKPoint<Float> {
        .init(x: midX, y: midY)
    }

    @inlinable var top: MKPoint<Float> {
        .init(x: midX, y: minY)
    }

    @inlinable var bottom: MKPoint<Float> {
        .init(x: midX, y: maxY)
    }
}

public extension MKRect {
    @inlinable var topLeft: MKPoint<Float> {
        .init(x: minX, y: minY)
    }

    @inlinable var left: MKPoint<Float> {
        .init(x: minX, y: midY)
    }

    @inlinable var bottomLeft: MKPoint<Float> {
        .init(x: minX, y: maxY)
    }
}

public extension MKRect {
    @inlinable var topRight: MKPoint<Float> {
        .init(x: maxX, y: minY)
    }

    @inlinable var right: MKPoint<Float> {
        .init(x: maxX, y: midY)
    }

    @inlinable var bottomRight: MKPoint<Float> {
        .init(x: maxX, y: maxY)
    }
}

public extension MKRect {
    @inlinable var x: Float { origin.x }
    @inlinable var y: Float { origin.y }

    @inlinable var width: Float { size.width }
    @inlinable var height: Float { size.height }
}

public extension MKRect {
    @inlinable var minX: Float { origin.x }
    @inlinable var minY: Float { origin.y }

    @inlinable var maxX: Float { origin.x + size.width }
    @inlinable var maxY: Float { origin.y + size.height }

    @inlinable var midX: Float { origin.x + size.width / 2 }
    @inlinable var midY: Float { origin.y + size.height / 2 }
}
