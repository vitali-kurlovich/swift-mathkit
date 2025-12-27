//
//  ConvertTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

public struct ConvertTransform<From, To> {
    public var from: From
    public var to: To

    public init(from: From, to: To) {
        self.from = from
        self.to = to
    }
}

extension ConvertTransform: Transform2D where From: InverseUnitTransform2D, To: UnitTransform2D {
    public func transform(_ source: CGPoint) -> CGPoint {
        return to.transform(from.inverse(source))
    }
}

extension ConvertTransform: InverseTransform2D where From: UnitTransform2D, To: InverseUnitTransform2D {
    public func inverse(_ source: CGPoint) -> CGPoint {
        from.transform(to.inverse(source))
    }
}

extension ConvertTransform: Equatable where From: Equatable, To: Equatable {}

extension ConvertTransform: Hashable where From: Hashable, To: Hashable {}
