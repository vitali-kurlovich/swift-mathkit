//
//  Affine2DTransform+InverseUnitTransform2D.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

extension Affine2DTransform: Transform, InverseTransform {
    public typealias Input = MKPoint<Float>
    public typealias Output = MKPoint<Float>

    public func transform(_ source: Input) -> Output {
        _transform.transform(source)
    }

    public func inverse(_ source: Output) -> Input {
        let inverted = _transform.inverted() ?? .identity
        return inverted.transform(source)
    }

//    public func inverse(_ source: CGPoint) -> UnitPoint {
//        guard let inverted = _transform.inverted() else {
//            return UnitPoint.center
//        }
//
//        let point = inverted.transform(source)
//        return .init(x: point.x, y: point.y)
//    }
}
