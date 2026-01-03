//
//  ShaderProvider.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public protocol ShaderProvider: Sendable {
    var shaderLibrary: ShaderLibrary { get }
    func shaderFunction(for name: String) -> ShaderFunction
}

public extension ShaderProvider {
    var shaderLibrary: ShaderLibrary {
        ShaderLibrary.bundle(Bundle.module)
    }

    func shaderFunction(for name: String) -> ShaderFunction {
        assert(!name.isEmpty)

        return ShaderFunction(library: shaderLibrary, name: name)
    }
}
