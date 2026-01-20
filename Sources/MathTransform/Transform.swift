//
//  Transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

public protocol Transform {
    associatedtype Input
    associatedtype Output

    func transform(_ source: Input) -> Output
}

public protocol InverseTransform {
    associatedtype Input
    associatedtype Output

    func inverse(_ source: Output) -> Input
}

public protocol ReverseTransform {
    associatedtype ReversedTransform: Transform

    func reverse() -> Self.ReversedTransform
}
